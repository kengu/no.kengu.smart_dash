//  Copyright 2014 The Flutter Authors. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification,
//  are permitted provided that the following conditions are met:
//
//      * Redistributions of source code must retain the above copyright
//        notice, this list of conditions and the following disclaimer.
//      * Redistributions in binary form must reproduce the above
//        copyright notice, this list of conditions and the following
//        disclaimer in the documentation and/or other materials provided
//        with the distribution.
//      * Neither the name of Google Inc. nor the names of its
//        contributors may be used to endorse or promote products derived
//        from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  --------
//
//  Copied from https://github.com/flutter/flutter/blob/main/examples/platform_channel/macos/Runner/MainFlutterWindow.swift
//
//  --------

import Cocoa
import Foundation
import FlutterMacOS
import SystemKit

enum Info {
 static var system = System()
}

class MainFlutterWindow: NSWindow {
  private let powerSource = PowerSource()
  private let stateChangeHandler = PowerSourceStateChangeHandler()
  private var eventSink: FlutterEventSink?

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.displayIfNeeded()
    self.setFrame(windowFrame, display: true)

    let registrar = flutterViewController.registrar(forPlugin: "SystemInfo")

    // Register battery method channel.
    let batteryChannel = FlutterMethodChannel(
      name: "no.kengu.smart_dash/battery",
      binaryMessenger: registrar.messenger)
    batteryChannel.setMethodCallHandler { [powerSource = self.powerSource] (call, result) in
      switch call.method {
      case "getBatteryLevel":
        guard powerSource.hasBattery() else {
          result(
            FlutterError(
              code: "NO_BATTERY",
              message: "Device does not have a battery",
              details: nil))
          return
        }
        guard let level = powerSource.getCurrentCapacity() else {
          result(
            FlutterError(
              code: "UNAVAILABLE",
              message: "Battery info unavailable",
              details: nil))
          return
        }
        result(level)
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    // Register charging event channel.
    let chargingChannel = FlutterEventChannel(
      name: "no.kengu.smart_dash/charging",
      binaryMessenger: registrar.messenger)
    chargingChannel.setStreamHandler(self)

    // Register cpu info method channel.
    let cpuInfoChannel = FlutterMethodChannel(name: "no.kengu.smart_dash/load",
      binaryMessenger: registrar.messenger)
    cpuInfoChannel.setMethodCallHandler { [weak self] (call, result) in
      switch call.method {
        case "getCpuUsage":
            self?.getCpuUsage { cpuUsageData in
              if let usage = cpuUsageData {
                result(usage)
              } else {
                result(
                  FlutterError(
                    code: "UNAVAILABLE",
                    message: "CPU info unavailable",
                    details: nil
                  )
                )
              }
            }
        case "getMemoryUsage":
            guard let usage = self?.getMemoryUsage() else {
              result(
                FlutterError(
                  code: "UNAVAILABLE",
                  message: "Memory info unavailable",
                  details: nil
                )
              )
              return
            }
            result(usage)
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }

    
  private func getCpuUsage(completion: @escaping ([String: Double]?) -> Void) {
    let usage = Info.system.usageCPU()
    let totalLoad = (usage.system + usage.user);
      
    self.calcAppCpuUsage(overTime: 2) { cpuUsagePercentage in
      if let cpuAppUsage = cpuUsagePercentage {
          completion(["total": totalLoad, "app": cpuAppUsage])
      } else {
          print("Failed to calculate CPU usage.")
          completion(nil)
      }
    }
  }
    
  func calcAppCpuUsage(overTime period: TimeInterval, completion: @escaping (Double?) -> Void) {
    DispatchQueue.global(qos: .background).async {
        
        
      guard let initialAppCpuTime = self.getAppCpuTime() else {
        print("Failed to get initial app CPU time.")
        return
      }
      guard let initialTotalCpuTime = self.getTotalCpuTime() else {
        print("Failed to get initial total CPU time.")
        return
      }

      // Sleep for the specified period
      Thread.sleep(forTimeInterval: period)

      guard let finalAppCpuTime = self.getAppCpuTime() else {
        print("Failed to get final app CPU time.")
        return
      }
      guard let finalTotalCpuTime = self.getTotalCpuTime() else {
        print("Failed to get final total CPU time.")
        return
      }

      let deltaAppCpuTime = finalAppCpuTime - initialAppCpuTime
      let deltaTotalCpuTime = finalTotalCpuTime - initialTotalCpuTime
        
        

      let cpuAppUsagePercentage = deltaTotalCpuTime > 0 ? (deltaAppCpuTime / deltaTotalCpuTime) * 100.0 : nil
      DispatchQueue.main.async {
          completion(cpuAppUsagePercentage)
      }
    }
  }

  // Adapted from https://stackoverflow.com/questions/8223348/get-cpu-usage-from-application-on-ios
  func getAppCpuTime() -> Double? {
      var kr: kern_return_t
      var taskInfo = mach_task_basic_info()
      var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size) / 4

      kr = withUnsafeMutablePointer(to: &taskInfo) {
          $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
              task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
          }
      }

      guard kr == KERN_SUCCESS else {
          return nil
      }

      var threadList: thread_act_array_t?
      var threadCount: mach_msg_type_number_t = 0

      kr = task_threads(mach_task_self_, &threadList, &threadCount)
      if kr != KERN_SUCCESS {
          return nil
      }

      var totIdle = 0.0
      var totUser = 0.0
      var totKernel = 0.0

      if let threadList = threadList {
          for j in 0..<Int(threadCount) {
              var thInfo = thread_basic_info()
              var threadInfoCount = mach_msg_type_number_t(THREAD_INFO_MAX)

              kr = withUnsafeMutablePointer(to: &thInfo) {
                  $0.withMemoryRebound(to: integer_t.self, capacity: Int(threadInfoCount)) {
                      thread_info(threadList[j], thread_flavor_t(THREAD_BASIC_INFO), $0, &threadInfoCount)
                  }
              }

              guard kr == KERN_SUCCESS else {
                  break;
              }

              let threadBasicInfo = thInfo
              if threadBasicInfo.flags & TH_FLAGS_IDLE == 0 {
                  totUser += Double(threadBasicInfo.user_time.seconds) + Double(threadBasicInfo.user_time.microseconds) / 1_000_000.0
                  totKernel += Double(threadBasicInfo.system_time.seconds) + Double(threadBasicInfo.system_time.microseconds) / 1_000_000.0
              } else {
                  totIdle += Double(threadBasicInfo.user_time.seconds) + Double(threadBasicInfo.user_time.microseconds) / 1_000_000.0 +
                             Double(threadBasicInfo.system_time.seconds) + Double(threadBasicInfo.system_time.microseconds) / 1_000_000.0
              }
          }

          kr = vm_deallocate(mach_task_self_, vm_address_t(bitPattern: threadList), vm_size_t(Int(threadCount) * MemoryLayout<thread_t>.stride))

          assert(kr == KERN_SUCCESS)
      }

      return totIdle + totUser + totKernel
  }

  func getTotalCpuTime() -> Double? {
      // arm64
      let ticksPerSecond = sysconf(_SC_CLK_TCK)// 24000000
      var cpuLoad = host_cpu_load_info()
      var count = mach_msg_type_number_t(MemoryLayout<host_cpu_load_info>.size) / 4

      let kerr = withUnsafeMutablePointer(to: &cpuLoad) {
          $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
              host_statistics(mach_host_self(), HOST_CPU_LOAD_INFO, $0, &count)
          }
      }

      if kerr == KERN_SUCCESS {
          let totalTicks = Double(cpuLoad.cpu_ticks.0) + Double(cpuLoad.cpu_ticks.1) +
              Double(cpuLoad.cpu_ticks.2) + Double(cpuLoad.cpu_ticks.3)
          return totalTicks / Double(ticksPerSecond)
      } else {
          return nil
      }
  }

  func getMemoryUsage() -> [String: Any]? {
    var stats: vm_statistics64 = vm_statistics64()
    var size = mach_msg_type_number_t(MemoryLayout<vm_statistics64>.stride / MemoryLayout<integer_t>.stride)
    let result: kern_return_t = withUnsafeMutablePointer(to: &stats) {
      $0.withMemoryRebound(to: integer_t.self, capacity: Int(size)) {
        host_statistics64(mach_host_self(), HOST_VM_INFO64, $0, &size)
      }
    }

    if result == KERN_SUCCESS {
      let pageSize = vm_kernel_page_size
      let total = UInt(ProcessInfo.processInfo.physicalMemory);
      let free = total - UInt(stats.active_count + stats.wire_count + stats.compressor_page_count) * pageSize
      guard let app = self.getAppMemoryUsage() else {
        print("Error getting app memory usage info")
        return nil
      }

      return ["free": free, "total": total, "app": app]// Return in MB
    } else {
      print("Failed to fetch memory statistics: \(result)")
      return nil
    }
  }

  func getAppMemoryUsage() -> UInt? {
      var info = task_basic_info()
      var count = mach_msg_type_number_t(MemoryLayout<task_basic_info>.size) / 4

      let kerr: kern_return_t = withUnsafeMutablePointer(to: &info) {
          $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
              task_info(mach_task_self_, task_flavor_t(TASK_BASIC_INFO), $0, &count)
          }
      }

      if kerr == KERN_SUCCESS {
          return UInt(info.resident_size)
      } else {
          print("Error with task_info(): \(kerr)")
          return nil
      }
  }

  /// Emit a power status event to the registered event sink.
  func emitPowerStatusEvent() {
    if let sink = self.eventSink {
      switch self.powerSource.getPowerState() {
      case .ac:
        sink("charging")
      case .battery:
        sink("discharging")
      case .unknown:
        sink("UNAVAILABLE")
      }
    }
  }
}

extension MainFlutterWindow: FlutterStreamHandler {
  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink)
    -> FlutterError?
  {
    self.eventSink = events
    self.emitPowerStatusEvent()
    self.stateChangeHandler.delegate = self
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    self.stateChangeHandler.delegate = nil
    self.eventSink = nil
    return nil
  }
}

extension MainFlutterWindow: PowerSourceStateChangeDelegate {
  func didChangePowerSourceState() {
    self.emitPowerStatusEvent()
  }
}

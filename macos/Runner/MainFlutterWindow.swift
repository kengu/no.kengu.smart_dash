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
            guard let usage = self?.getCpuUsage() else {
              result(
                FlutterError(
                  code: "UNAVAILABLE",
                  message: "CPU info unavailable",
                  details: nil))
              return
            }
            result(usage)
        case "getMemoryUsage":
            guard let usage = self?.getMemoryUsage() else {
              result(
                FlutterError(
                  code: "UNAVAILABLE",
                  message: "Memory info unavailable",
                  details: nil))
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

  private func getCpuUsage() -> [String: Double]? {
    var totalUsage: Double = 0.0

    var processorCount: natural_t = 0
    var processorInfo: processor_info_array_t?
    var processorMsgCount: mach_msg_type_number_t = 0

    let result = host_processor_info(mach_host_self(), PROCESSOR_CPU_LOAD_INFO, &processorCount, &processorInfo, &processorMsgCount)

    if result == KERN_SUCCESS {
      let processorInfoSize = MemoryLayout<integer_t>.size * Int(processorMsgCount)
      let processorInfoPointer = UnsafeBufferPointer(start: processorInfo, count: processorInfoSize)
      let processorValues = Array(processorInfoPointer)

      for i in 0..<Int(processorCount) {
          let offset = Int(CPU_STATE_MAX * Int32(i))
          let user = processorValues[offset + Int(CPU_STATE_USER)]
          let system = processorValues[offset + Int(CPU_STATE_SYSTEM)]
          let idle = processorValues[offset + Int(CPU_STATE_IDLE)]
          let nice = processorValues[offset + Int(CPU_STATE_NICE)]
          let total = Int(user + system + idle + nice)
          if total > 0 {
              totalUsage += Double(user + system + nice) / Double(total)
          }
      }

      totalUsage /= Double(processorCount)

      let deallocResult = vm_deallocate(mach_task_self_, vm_address_t(bitPattern: processorInfo), vm_size_t(processorMsgCount * UInt32(MemoryLayout<integer_t>.size)))
      if deallocResult != KERN_SUCCESS {
        print("Error deallocating processor info: \(deallocResult)")
        return nil
      }
    } else {
      print("Error getting processor info: \(result)")
      return nil
    }

    guard let app = getAppCpuTime() else {
      print("Error getting app cpu usage info")
      return nil
    }

    let total = getTotalCpuTime()

    return ["total": totalUsage * 100.0, "app": Double(app) / total]
  }

  func getAppCpuTime() -> Double? {
    var taskInfo = mach_task_basic_info()
    var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size) / 4

    let kerr = withUnsafeMutablePointer(to: &taskInfo) {
      $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
          task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
      }
    }

    if kerr == KERN_SUCCESS {
      return Double(taskInfo.user_time.microseconds + taskInfo.system_time.microseconds) / 1_000_000.0 +
             Double(taskInfo.user_time.seconds + taskInfo.system_time.seconds)
    } else {
      return nil
    }
  }

  func getTotalCpuTime() -> Double {
      var cpuLoad = host_cpu_load_info()
      var count = mach_msg_type_number_t(MemoryLayout<host_cpu_load_info>.size) / 4

      let kerr = withUnsafeMutablePointer(to: &cpuLoad) {
          $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
              host_statistics(mach_host_self(), HOST_CPU_LOAD_INFO, $0, &count)
          }
      }

      if kerr == KERN_SUCCESS {
          return Double(cpuLoad.cpu_ticks.0) + Double(cpuLoad.cpu_ticks.1) +
            Double(cpuLoad.cpu_ticks.2) + Double(cpuLoad.cpu_ticks.3)
      } else {
          return 0.0
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
      //let total = UInt(stats.free_count + stats.active_count + stats.inactive_count + stats.wire_count + stats.compressor_page_count) * pageSize
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

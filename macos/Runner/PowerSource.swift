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
//  Copied from https://github.com/flutter/flutter/blob/main/examples/platform_channel/macos/Runner/PowerSource.swift
//
//  --------
import Foundation
import IOKit.ps

enum PowerState {
  case ac
  case battery
  case unknown
}

/// A convenience wrapper for an IOKit power source.
final class PowerSource {
  let info = IOPSCopyPowerSourcesInfo().takeRetainedValue()
  let sources: Array<CFTypeRef>

  init() {
    sources = IOPSCopyPowerSourcesList(info).takeRetainedValue() as Array
  }

  func hasBattery() -> Bool {
    return !sources.isEmpty
  }

  /// Returns the current power source capacity. Apple-defined power sources will return this value
  /// as a percentage.
  func getCurrentCapacity() -> Int? {
    if let source = sources.first {
      let description =
        IOPSGetPowerSourceDescription(info, source).takeUnretainedValue() as! [String: AnyObject]
      if let level = description[kIOPSCurrentCapacityKey] as? Int {
        return level
      }
    }
    return nil
  }

  /// Returns whether the device is drawing battery power or connected to an external power source.
  func getPowerState() -> PowerState {
    if let source = sources.first {
      let description =
        IOPSGetPowerSourceDescription(info, source).takeUnretainedValue() as! [String: AnyObject]
      if let state = description[kIOPSPowerSourceStateKey] as? String {
        switch state {
        case kIOPSACPowerValue:
          return .ac
        case kIOPSBatteryPowerValue:
          return .battery
        default:
          return .unknown
        }
      }
    }
    return .unknown
  }
}

protocol PowerSourceStateChangeDelegate: AnyObject {
  func didChangePowerSourceState()
}

/// A listener for system power source state change events. Notifies the delegate on each event.
final class PowerSourceStateChangeHandler {
  private var runLoopSource: CFRunLoopSource?
  weak var delegate: PowerSourceStateChangeDelegate?

  init() {
    let context = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
    self.runLoopSource = IOPSNotificationCreateRunLoopSource(
      { (context: UnsafeMutableRawPointer?) in
        let unownedSelf = Unmanaged<PowerSourceStateChangeHandler>.fromOpaque(
          UnsafeRawPointer(context!)
        ).takeUnretainedValue()
        unownedSelf.delegate?.didChangePowerSourceState()
      }, context
    ).takeRetainedValue()
    CFRunLoopAddSource(CFRunLoopGetCurrent(), self.runLoopSource, .defaultMode)
  }

  deinit {
    CFRunLoopRemoveSource(CFRunLoopGetCurrent(), self.runLoopSource, .defaultMode)
  }
}
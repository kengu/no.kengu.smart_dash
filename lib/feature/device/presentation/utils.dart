import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_dash/feature/device/domain/device.dart';

IconData toIconData(Device device) {
  return switch (device.type) {
    DeviceType.thermostat => CupertinoIcons.thermometer,
    DeviceType.energyController => CupertinoIcons.power,
    _ => Icons.device_hub,
  };
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_dash_device/smart_dash_device.dart';

IconData toIconData(Device device) {
  return switch (device.type) {
    DeviceType.sensor => Icons.sensors,
    DeviceType.weatherNow => Icons.cloud_outlined,
    DeviceType.astroSwitch => CupertinoIcons.lightbulb,
    DeviceType.onOffRelay => CupertinoIcons.arrow_swap,
    DeviceType.thermostat => CupertinoIcons.thermometer,
    DeviceType.energyController => CupertinoIcons.power,
    _ => Icons.device_hub,
  };
}

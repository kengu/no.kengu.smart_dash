import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/domain/energy_summary.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/flow/tokens.dart';

class SikomPowerFlow extends Flow {
  SikomPowerFlow() : super('sikom.power');

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (event is DriverUpdatedEvent) {
      for (final device in event.devices.where((d) => d.hasEnergy)) {
        yield FlowEvent<EnergySummary>(
          Tokens.energy,
          device.energy ?? EnergySummary.empty(),
          device.energy?.lastUpdated ?? device.lastUpdated,
        );
      }
    }
  }

  @override
  bool when(Object event) =>
      event is DriverUpdatedEvent &&
      event.devices.any(
        (d) => d.hasEnergy,
      );
}

class SikomEnergyFlow extends Flow {
  SikomEnergyFlow() : super('sikom.energy');

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (event is DriverUpdatedEvent) {
      for (final device in event.devices.where((d) => d.hasEnergy)) {
        yield FlowEvent<int>(
          Tokens.power,
          device.energy?.currentPower ?? 0,
          device.lastUpdated,
        );
      }
    }
  }

  @override
  bool when(Object event) =>
      event is DriverUpdatedEvent &&
      event.devices.any(
        (d) => d.hasEnergy,
      );
}

class SikomVoltageFlow extends Flow {
  SikomVoltageFlow() : super('sikom.voltage');

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (event is DriverUpdatedEvent) {
      for (final device in event.devices.where((d) => d.hasVoltage)) {
        yield FlowEvent<int>(
          Tokens.voltage,
          device.voltage ?? 0,
          device.lastUpdated,
        );
      }
    }
  }

  @override
  bool when(Object event) =>
      event is DriverUpdatedEvent &&
      event.devices.any(
        (d) => d.hasVoltage,
      );
}

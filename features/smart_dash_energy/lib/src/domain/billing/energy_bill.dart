import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_energy/smart_dash_energy.dart';

part 'energy_bill.freezed.dart';
part 'energy_bill.g.dart';

@freezed
sealed class EnergyBillMonth with _$EnergyBillMonth {
  const EnergyBillMonth._();
  const factory EnergyBillMonth({
    required DateTime begin,
    required List<EnergyBillDay> daily,
  }) = _EnergyBillMonth;

  double get inNok {
    return priceInNok + tariffInNok;
  }

  double get inEur {
    return priceInEur + tariffInEur;
  }

  double get priceInNok {
    return daily.fold(0, (sum, next) => sum + next.priceInNok);
  }

  double get priceInEur {
    return daily.fold(0, (sum, next) => sum + next.priceInEur);
  }

  double get tariffInNok {
    return daily.fold(0, (sum, next) => sum + next.tariffInNok);
  }

  double get tariffInEur {
    return daily.fold(0, (sum, next) => sum + next.tariffInEur);
  }

  DateTime get end => daily.isEmpty ? begin : daily.last.begin;

  Duration get span => daily.isNotEmpty ? end.difference(begin) : Duration.zero;

  factory EnergyBillMonth.fromJson(Map<String, Object?> json) =>
      _$EnergyBillMonthFromJson(json);
}

@freezed
sealed class EnergyBillDay with _$EnergyBillDay {
  const EnergyBillDay._();
  const factory EnergyBillDay({
    required DateTime begin,
    required List<EnergyBillHour> hourly,
  }) = _EnergyBillDay;

  double get energy {
    return hourly.fold(0, (sum, next) => sum + next.energy);
  }

  double get energyInKwh {
    return hourly.fold(0, (sum, next) => sum + next.energyInKwh);
  }

  double get inNok {
    return hourly.fold(0, (sum, next) => sum + next.inNok);
  }

  double get inNokIncVat {
    return hourly.fold(0, (sum, next) => sum + next.inNokIncVat);
  }

  double get inEur {
    return hourly.fold(0, (sum, next) => sum + next.inEur);
  }

  double get inEurIncVat {
    return hourly.fold(0, (sum, next) => sum + next.inEurIncVat);
  }

  double get priceInNok {
    return hourly.fold(0, (sum, next) => sum + next.priceInNok);
  }

  double get priceInEur {
    return hourly.fold(0, (sum, next) => sum + next.priceInEur);
  }

  double get tariffInNok {
    return hourly.fold(0, (sum, next) => sum + next.tariffInNok);
  }

  double get tariffInEur {
    return hourly.fold(0, (sum, next) => sum + next.tariffInEur);
  }

  DateTime get end => hourly.isEmpty ? begin : hourly.last.begin;

  Duration get span =>
      hourly.isNotEmpty ? end.difference(begin) : Duration.zero;

  factory EnergyBillDay.fromJson(Map<String, Object?> json) =>
      _$EnergyBillDayFromJson(json);
}

@freezed
sealed class EnergyBillHour with _$EnergyBillHour {
  const EnergyBillHour._();
  const factory EnergyBillHour({
    required int vat,
    required DateTime end,
    required DateTime begin,
    required double energy,
    required ElectricityPrice price,
    required ElectricityTariff tariff,
  }) = _EnergyBillHour;

  double get energyInKwh => energy / 1000;

  double get vatRate => 1 + vat / 100;

  double get inNok {
    return priceInNok + tariffInNok;
  }

  double get inNokIncVat {
    return inNok * vatRate;
  }

  double get inEur {
    return priceInEur + tariffInEur;
  }

  double get inEurIncVat {
    return inEur * vatRate;
  }

  double get priceInNok {
    return price.nokPerKwh * energyInKwh;
  }

  double get priceInEur {
    return price.eurPerKwh * energyInKwh;
  }

  double get tariffInNok {
    final consumption = tariff.consumption.firstWhereOptional(
      (e) => e.isWithin(begin.hour),
    );
    return consumption.isPresent
        ? consumption.value.nokPerKwh * energyInKwh
        : 0.0;
  }

  double get tariffInEur {
    return tariffInNok * price.nokToEurRate;
  }

  factory EnergyBillHour.fromJson(Map<String, Object?> json) =>
      _$EnergyBillHourFromJson(json);
}

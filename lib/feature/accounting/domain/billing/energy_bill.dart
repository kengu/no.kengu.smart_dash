import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/accounting/domain/pricing/electricity.dart';

part 'energy_bill.freezed.dart';
part 'energy_bill.g.dart';

@freezed
class EnergyBill with _$EnergyBill {
  const EnergyBill._();
  const factory EnergyBill({
    required int vat,
    required DateTime end,
    required DateTime begin,
    required double energy,
    required ElectricityPrice price,
    required ElectricityTariff tariff,
  }) = _EnergyBill;

  double get energyInKwh => energy / 1000;

  double get vatRate => 1 + vat / 100;

  double get inNok {
    return priceInNok + tariffInNok;
  }

  double get inEur {
    return priceInEur + tariffInEur;
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

  int get hours => end.difference(begin).inHours;

  int get minutes => end.difference(begin).inMinutes;

  factory EnergyBill.fromJson(Map<String, Object?> json) =>
      _$EnergyBillFromJson(json);
}

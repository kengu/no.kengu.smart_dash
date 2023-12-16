import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/accounting/domain/pricing/electricity_price.dart';

part 'energy_bill.freezed.dart';
part 'energy_bill.g.dart';

@freezed
class EnergyBill with _$EnergyBill {
  const EnergyBill._();
  const factory EnergyBill({
    required ElectricityPrice base,
    required double energy,
    required DateTime begin,
    required DateTime end,
  }) = _EnergyBill;

  double get inNok {
    return base.nokPerKwh / base.minutes * minutes;
  }

  double get inEur {
    return base.eurPerKwh / base.minutes * minutes;
  }

  int get hours => end.difference(begin).inHours;
  int get minutes => end.difference(begin).inMinutes;

  factory EnergyBill.fromJson(Map<String, Object?> json) =>
      _$EnergyBillFromJson(json);
}

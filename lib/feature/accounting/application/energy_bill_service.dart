import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/accounting/application/electricity_price_service.dart';
import 'package:smart_dash/feature/accounting/domain/billing/energy_bill.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/flow/tokens.dart';
import 'package:smart_dash/util/guard.dart';

part 'energy_bill_service.g.dart';

class EnergyBillService {
  EnergyBillService(this.ref);

  final Ref ref;

  Future<List<EnergyBill>> getBillHourly(String area, DateTime when) =>
      guard(() async {
        final prices = await ref
            .read(electricityPriceServiceProvider)
            .getPriceHourly(area, when);
        final result = await ref.read(historyManagerProvider).get(Tokens.power);

        final bill = <EnergyBill>[];
        if (result.isPresent) {
          for (int i = 0; i < result.value.length; i++) {
            final ts = result.value.tsAt(i);
            final price = prices.firstWhereOptional((p) =>
                p.begin.millisecondsSinceEpoch <= ts.millisecondsSinceEpoch &&
                p.end.millisecondsSinceEpoch >= ts.millisecondsSinceEpoch);
            if (price.isPresent) {
              bill.add(EnergyBill(
                base: price.value,
                energy: result.value.rowAt(i).first.toDouble(),
                begin: ts,
                end: ts.add(result.value.span),
              ));
            }
          }
        }
        return bill;
      });
}

@Riverpod(keepAlive: true)
EnergyBillService energyBillService(EnergyBillServiceRef ref) =>
    EnergyBillService(
      ref,
    );

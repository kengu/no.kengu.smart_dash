import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/accounting/application/energy_bill_service.dart';
import 'package:smart_dash/feature/accounting/domain/billing/energy_bill.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';
import 'package:smart_dash/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/util/data/units.dart';

class EnergyBillTile extends ConsumerWidget {
  const EnergyBillTile({
    super.key,
    required this.when,
    required this.area,
  });

  final String area;
  final DateTime when;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(energyBillServiceProvider);
    return FutureBuilder(
      future: service.getBillHourly(area, when),
      builder: (context, snapshot) {
        final history = _bill(snapshot);
        final at = DateTime.now();
        final now = history.indexNow(false);
        final begin = history.indexAt(when);
        final today = history.sum(begin: begin, span: at.difference(when));
        return SmartDashTile(
          key: const ValueKey('energy_bill'),
          title: 'Energy Bill',
          subTitle: 'Today @ ${at.hour} hours ($area)',
          constraints: const BoxConstraints(
            minWidth: 270,
            minHeight: 150,
          ),
          leading: const Icon(
            Icons.summarize_outlined,
            color: Colors.lightGreen,
          ),
          trailing: Text(
            today.lastRow.price('kr', now),
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
          body: const Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Center(child: Text('TODO')),
          ),
        );
      },
    );
  }

  TimeSeries _bill(AsyncSnapshot<List<EnergyBill>> snapshot) {
    final prices = snapshot.hasData
        ? DataArray(
            [snapshot.data!.map((e) => e.inNok).toList()],
            coords: List.generate(
              snapshot.data!.length,
              (index) => {'hour': index},
            ),
            dims: [{}],
          )
        : DataArray.size(1, [{}]);
    return TimeSeries(
      name: 'price',
      array: prices,
      offset: when,
      span: TimeScale.hours.to(),
    );
  }
}

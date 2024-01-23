import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash/core/application/fullscreen_state.dart';
import 'package:smart_dash/util/data/units.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  final df = DateFormat('dd-MM-yyyy HH:mm');

  bool get isFullscreen => FullscreenState.watch(ref);

  String _filter = '';

  @override
  Widget build(BuildContext context) {
    return ref.watch(historyProvider()).when(
          data: _build,
          loading: _build,
          error: SmartDashErrorWidget.from,
        );
  }

  Widget _build([HistoryEvent? event]) {
    return FutureBuilder<List<TimeSeries>>(
        future: ref
            .read(historyManagerProvider)
            .getAll(ttl: const Duration(minutes: 1)),
        initialData: ref.read(historyManagerProvider).getCachedAll(),
        builder: (context, snapshot) {
          final data = _where(snapshot);
          return Padding(
            padding: !isFullscreen
                ? const EdgeInsets.all(24.0).copyWith(bottom: 0.0)
                : const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                if (!isFullscreen)
                  const SmartDashHeader(
                    title: 'History',
                  ),
                Padding(
                  padding: !isFullscreen
                      ? const EdgeInsets.only(top: 56.0)
                      : const EdgeInsets.only(top: 0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) => setState(() {
                            _filter = value;
                          }),
                          decoration: const InputDecoration(
                            labelText: 'Search',
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: DataTable(
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Token',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'First',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Last',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Points',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Zeros',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Min',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Average',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                tooltip: 'Hourly Average',
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Max',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                            rows: data.map((e) => _buildDataRow(e)).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<TimeSeries> _where(AsyncSnapshot<List<TimeSeries>> snapshot) {
    final data = snapshot.hasData ? snapshot.data! : <TimeSeries>[];
    return data
        .where((e) => _filter.isEmpty || e.name.contains(_filter))
        .toList();
  }

  DataRow _buildDataRow(TimeSeries series) {
    final stats = series.stats(
      span: TimeScale.hours.to(),
    );
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(
          series.name,
        )),
        DataCell(Text(
          df.format(series.offset),
        )),
        DataCell(Text(
          df.format(series.end),
        )),
        DataCell(Text(
          series.length.toString(),
        )),
        DataCell(Text(
          stats.zeros.last.toString(),
        )),
        DataCell(Text(
          stats.isEmpty ? "0" : stats.min.last.format(stats.unit),
        )),
        DataCell(Text(
          stats.isEmpty ? "0" : stats.avg.last.format(stats.unit),
        )),
        DataCell(Text(
          stats.isEmpty ? "0" : stats.max.last.format(stats.unit),
        ))
      ],
    );
  }
}

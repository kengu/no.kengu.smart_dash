import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash/scaffold/application/fullscreen_state.dart';
import 'package:smart_dash/util/data/units.dart';
import 'package:smart_dash/util/time/time_series.dart';
import 'package:smart_dash/widget/smart_dash_error_widget.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  Optional<HistoryManager> _manager = const Optional.empty();
  Optional<Future<List<Optional<TimeSeries>>>> _request =
      const Optional.empty();

  final df = DateFormat('dd-MM-yyyy HH:mm');

  bool get isFullscreen => FullscreenState.watch(ref);

  @override
  void initState() {
    super.initState();
    _manager = Optional.of(ref.read(historyManagerProvider));
    _fetchTokens();
  }

  Future<List<Optional<TimeSeries>>> _fetchTokens() {
    if (_request.isEmpty) {
      _request = Optional.of(
        Future.wait(
          _manager.value.tokens.map(_manager.value.get).toList(),
        ),
      );
    }
    return _request.value;
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(historyProvider).when(
          data: _build,
          loading: _build,
          error: SmartDashErrorWidget.from,
        );
  }

  Widget _build([HistoryEvent? event]) {
    return FutureBuilder(
        future: _fetchTokens(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _request = const Optional.empty();
          }
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
                  child: SingleChildScrollView(
                    child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Token',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'First',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Last',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Points',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Min',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Average',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Max',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ],
                        rows: snapshot.hasData
                            ? snapshot.data!
                                .map((e) => DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text(
                                          e.value.name,
                                        )),
                                        DataCell(Text(
                                          df.format(e.value.offset),
                                        )),
                                        DataCell(Text(
                                          df.format(e.value.end),
                                        )),
                                        DataCell(Text(
                                          e.value.length.toString(),
                                        )),
                                        DataCell(Text(
                                          e.value.min().lastRow.first.format(e
                                              .value.array.dims.last['unit']!
                                              .toString()),
                                        )),
                                        DataCell(Text(
                                          e.value.avg().lastRow.first.format(e
                                              .value.array.dims.last['unit']!
                                              .toString()),
                                        )),
                                        DataCell(Text(
                                          e.value.max().lastRow.first.format(e
                                              .value.array.dims.last['unit']!
                                              .toString()),
                                        )),
                                      ],
                                    ))
                                .toList()
                            : <DataRow>[]),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

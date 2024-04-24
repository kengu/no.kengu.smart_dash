import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smart_dash/core/presentation/scaffold/fullscreen_state.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash/util/data/units.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  bool get isFullscreen => FullscreenState.watch(ref);

  String _filter = '';

  int _pageSize = 10;

  final List<TimeSeries> _series = [];

  static const List<DataColumn> _columns = [
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
          'Zeros',
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
      tooltip: 'Hourly Average',
    ),
    DataColumn(
      label: Expanded(
        child: Text(
          'Max',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TimeSeries>>(
        future: ref
            .watch(historyManagerProvider)
            .getAll(ttl: const Duration(minutes: 1)),
        initialData: ref.watch(historyManagerProvider).getCachedAll(),
        builder: (context, snapshot) {
          final data = _where(snapshot);
          return ref.watch(historyProvider()).when(
                data: (e) => _build(_update(e)),
                loading: () => _build(data),
                error: SmartDashErrorWidget.from,
              );
        });
  }

  Widget _build(List<TimeSeries> data) {
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
              child: SizedBox(
                width: double.infinity,
                child: SelectionArea(
                  child: PaginatedDataTable(
                    header: Padding(
                      padding: const EdgeInsets.all(0.0),
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
                    rowsPerPage: _pageSize,
                    availableRowsPerPage: const [10, 25, 50],
                    onRowsPerPageChanged: (value) {
                      setState(() {
                        _pageSize = value!;
                      });
                    },
                    columns: _columns,
                    //rows: data.map((e) => _buildDataRow(e)).toList(),
                    source: _TimeSeriesDataSource(data: data),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TimeSeries> _where(AsyncSnapshot<List<TimeSeries>> snapshot) {
    final data = snapshot.hasData ? snapshot.data! : <TimeSeries>[];
    return _series
      ..clear()
      ..addAll(
        data.where((e) => _filter.isEmpty || e.name.contains(_filter)).toSet(),
      );
  }

  List<TimeSeries> _update(HistoryEvent e) {
    if (e.data.name.contains(_filter)) {
      _series
        ..remove(e.data)
        ..add(e.data);
    }
    return _series;
  }
}

class _TimeSeriesDataSource extends DataTableSource {
  _TimeSeriesDataSource({required this.data});

  final df = DateFormat('dd-MM-yyyy HH:mm');

  final List<TimeSeries> data;
  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return _buildDataRow(data[index]);
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
          stats.isEmpty ? "0" : series.lastRow.last.format(stats.unit),
        )),
        DataCell(Text(
          stats.isEmpty ? "0" : stats.min.last.format(stats.unit),
        )),
        DataCell(Text(
          stats.isEmpty ? "0" : stats.avg.last.format(stats.unit),
        )),
        DataCell(Text(
          stats.isEmpty ? "0" : stats.max.last.format(stats.unit),
        )),
      ],
    );
  }
}

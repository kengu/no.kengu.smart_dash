import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

extension TokenX on Token {
  TimeSeries emptyTs({DateTime? offset, Duration? span}) => TimeSeries(
        name: name,
        offset: offset ?? DateTime.now(),
        span: span ?? TimeScale.minutes.to(),
        array: DataArray.size(1, [
          toJson(),
        ]),
      );

  TimeSeries toTs(HistoryEvent? event, [int size = 90]) {
    if (event != null && event.token == this) {
      return event.data.clamp(size, size, pad: 0);
    }
    return emptyTs();
  }
}

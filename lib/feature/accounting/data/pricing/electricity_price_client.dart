import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:smart_dash/feature/accounting/domain/pricing/electricity.dart';
import 'package:smart_dash/util/guard.dart';

import 'electricity_price_response.dart';

class ElectricityPriceClient {
  ElectricityPriceClient(this.ref, this.api);
  final Dio api;
  final Ref ref;

  final _log = Logger('$ElectricityPriceClient');

  Future<List<ElectricityPrice>> getPriceHourly(
      String area, DateTime when) async {
    return guard(() async {
      final path = '/${when.year}/'
          '${when.month < 10 ? '0${when.month}' : when.month}-'
          '${when.day < 10 ? '0${when.day}' : when.day}_$area.json';
      final response = await api.get(
        path /*'/2023/03-28_NO5.json'*/,
        options: Options(
          validateStatus: (status) {
            final success = status != null && status < 400;
            if (!success) {
              _log.warning(
                'Fetching electricity prices '
                'for [$when] failed: [$status] $path',
              );
            }
            return success;
          },
        ),
      );
      _log.fine('Fetched electricity prices for [$when]: ${response.realUri}');
      return ElectricityPriceResponse.fromJson(
        {'data': response.data},
      ).prices;
    });
  }
}

final electricityPriceClientProvider = Provider((ref) => ElectricityPriceClient(
      ref,
      Dio(BaseOptions(
          headers: {},
          baseUrl: 'https://www.hvakosterstrommen.no/api/v1/prices'))
        // Process json in the background
        ..transformer = BackgroundTransformer(),
    ));

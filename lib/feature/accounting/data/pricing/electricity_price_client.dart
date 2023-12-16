import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/accounting/domain/pricing/electricity_price.dart';
import 'package:smart_dash/util/guard.dart';

import 'electricity_price_response.dart';

class ElectricityPriceClient {
  ElectricityPriceClient(this.ref, this.api);
  final Dio api;
  final Ref ref;

  Future<List<ElectricityPrice>> getPriceHourly(
      String area, DateTime when) async {
    return guard(() async {
      final path = '/${when.year}/'
          '${when.month < 9 ? '0${when.month}' : when.month}-'
          '${when.day < 9 ? '0${when.day}' : when.day}_$area.json';
      final response = await api.get(path /*'/2023/03-28_NO5.json'*/);
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

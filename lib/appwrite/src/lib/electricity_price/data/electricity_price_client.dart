import 'package:dio/dio.dart';

import '../domain/electricity_price.dart';
import 'electricity_price_response.dart';

class ElectricityPriceClient {
  ElectricityPriceClient(this.api);
  final Dio api;

  Future<List<ElectricityPrice>> getPriceHourly(
      String area, DateTime when) async {
    final path = '/${when.year}/'
        '${when.month < 9 ? '0${when.month}' : when.month}-'
        '${when.day < 9 ? '0${when.day}' : when.day}_$area.json';
    final response = await api.get(path /*'/2023/03-28_NO5.json'*/);
    return ElectricityPriceResponse.fromJson(
      {'data': response.data},
    ).prices;
  }
}

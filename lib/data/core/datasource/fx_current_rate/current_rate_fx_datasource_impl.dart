import 'package:dio/dio.dart';
import 'package:fx_app_challenge/data/api/api_constant.dart';
import 'package:fx_app_challenge/data/core/datasource/fx_current_rate/current_rate_fx_datasource.dart';
import 'package:fx_app_challenge/data/core/models/convert.dart';

class CurrentFXRateDataSourceImpl implements CurrentFXRateDataSource {
  final Dio _client;
  CurrentFXRateDataSourceImpl(this._client);

  @override
  Future<Convert?> getFXConversion(
      {required String from,
      required String to,
      required String amount}) async {
    try {
      final response = await _client.get(ApiConstants.CURRENCY_COMVERSION,
          queryParameters: {"from": from, 'to': to, 'amount': amount});

      return Convert.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}

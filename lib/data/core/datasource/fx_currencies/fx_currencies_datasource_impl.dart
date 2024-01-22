import 'package:dio/dio.dart';
import 'package:fx_app_challenge/data/api/api_constant.dart';
import 'package:fx_app_challenge/data/core/datasource/fx_currencies/fx_currencies_datasource.dart';
import 'package:fx_app_challenge/data/core/models/currency_list/currency_list.dart';

class FxCurrenciesDataSourceImpl implements FXCurrenciesDataSource {
  final Dio _client;
  FxCurrenciesDataSourceImpl(this._client);

  @override
  Future<CurrencyList?> getFXCurrencies() async {
    try {
      final response = await _client.get(ApiConstants.CURRENCY_LIST);

      return CurrencyList.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}

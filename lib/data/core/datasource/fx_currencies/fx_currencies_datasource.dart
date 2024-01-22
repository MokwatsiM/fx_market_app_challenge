import 'package:fx_app_challenge/data/core/models/currency_list/currency_list.dart';

abstract class FXCurrenciesDataSource {
  Future<CurrencyList?> getFXCurrencies();
}

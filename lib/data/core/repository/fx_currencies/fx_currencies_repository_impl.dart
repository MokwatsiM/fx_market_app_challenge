import 'package:fx_app_challenge/data/core/datasource/fx_currencies/fx_currencies_datasource.dart';

import 'package:fx_app_challenge/data/core/models/currency_list/currency_list.dart';
import 'package:fx_app_challenge/data/core/repository/fx_currencies/fx_currencies_repository.dart';

class FXCurrenciesRespositoryImpl implements FXCurrenciesRepository {
  final FXCurrenciesDataSource _fxCurrenciesDataSource;

  FXCurrenciesRespositoryImpl(this._fxCurrenciesDataSource);

  @override
  Future<CurrencyList?>? getFXCurrencies() {
    try {
      return _fxCurrenciesDataSource.getFXCurrencies();
    } catch (e) {
      return null;
    }
  }
}

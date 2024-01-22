import 'package:fx_app_challenge/data/core/datasource/fx_history_rates/fx_history_rates_datasource.dart';
import 'package:fx_app_challenge/data/core/models/fx_history.dart';
import 'package:fx_app_challenge/data/core/repository/fx_hostory_rates/fx_history_rate_repository.dart';

class FXHistoryRateRepositoryImpl extends FXHistoryRateRepositoy {
  final FXHistoryRatesDatasource _fxHistoryRatesDatasource;

  FXHistoryRateRepositoryImpl(this._fxHistoryRatesDatasource);
  @override
  Future<List<FXHistory>?> getFXHistoryRatesDatasource(
      {required String currency}) async {
    try {
      final  map = await _fxHistoryRatesDatasource
          .getFXHistoryRatesDatasource(currency: currency);
      return map;
    } catch (e) {
      return null;
    }
  }
}

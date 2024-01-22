import 'package:fx_app_challenge/data/core/datasource/fx_current_rate/current_rate_fx_datasource.dart';
import 'package:fx_app_challenge/data/core/models/convert.dart';
import 'package:fx_app_challenge/data/core/repository/fx_current_rate/current_rate_fx_repository.dart';

class CurrentrateFXRespositoryImpl implements CurrentRateFXRepository {
  final CurrentFXRateDataSource _currentFXRateDataSource;

  CurrentrateFXRespositoryImpl(this._currentFXRateDataSource);
  @override
  Future<Convert?> getFXConversion(
      {required String from,
      required String to,
      required String amount}) async {
    try {
      return await _currentFXRateDataSource.getFXConversion(
          from: from, to: to, amount: amount);
    } catch (e) {
      return null;
    }
  }
}

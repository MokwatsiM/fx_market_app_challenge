import 'package:fx_app_challenge/data/core/models/fx_history.dart';

abstract class FXHistoryRatesDatasource {
  Future<List<FXHistory>?> getFXHistoryRatesDatasource({required String currency});
}

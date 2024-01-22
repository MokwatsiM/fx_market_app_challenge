import 'package:fx_app_challenge/data/core/models/fx_history.dart';

abstract class FXHistoryRateRepositoy {
  Future<List<FXHistory>?> getFXHistoryRatesDatasource(
      {required String currency});
}

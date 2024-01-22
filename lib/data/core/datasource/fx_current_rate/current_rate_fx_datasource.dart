import 'package:fx_app_challenge/data/core/models/convert.dart';

abstract class CurrentFXRateDataSource {
  Future<Convert?> getFXConversion(
      {required String from, required String to, required String amount});
}

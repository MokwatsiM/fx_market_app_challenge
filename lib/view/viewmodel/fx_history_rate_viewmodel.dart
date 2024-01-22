import 'package:flutter/material.dart';
import 'package:fx_app_challenge/data/core/models/fx_history.dart';
import 'package:fx_app_challenge/data/core/repository/fx_hostory_rates/fx_history_rate_repository.dart';
import 'package:fx_app_challenge/utils/loading.dart';

class FXHistoryRateViewmodel extends ChangeNotifier {
  final FXHistoryRateRepositoy fxHistoryRateRepositoy;
  LoadingStatus _fetchState = LoadingStatus.notfetched;
  LoadingStatus get fetchState => _fetchState;
  List<FXHistory>? _rates;

  List<FXHistory>? get rates => _rates;

  FXHistoryRateViewmodel({required this.fxHistoryRateRepositoy});

  Future<List<FXHistory>?> getFXHistoryRates({required String currency}) async {
    if (_rates != null) {
      _fetchState = LoadingStatus.done;
      notifyListeners();
    } else {
      _fetchState = LoadingStatus.fetching;
      notifyListeners();
    }
    try {
      _rates = await fxHistoryRateRepositoy.getFXHistoryRatesDatasource(
          currency: currency);
      if (_rates != null) {
        _fetchState = LoadingStatus.done;

        notifyListeners();
      } else {
        _fetchState = LoadingStatus.error;
        notifyListeners();
      }
      return _rates;
    } catch (e) {
      _fetchState = LoadingStatus.error;
      _rates = null;
      notifyListeners();

      return null;
    }
  }

  void clear() {
    _rates = null;
    notifyListeners();
  }
}

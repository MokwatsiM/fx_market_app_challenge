import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fx_app_challenge/data/core/models/convert.dart';
import 'package:fx_app_challenge/data/core/repository/fx_current_rate/current_rate_fx_repository.dart';
import 'package:fx_app_challenge/utils/loading.dart';

class CurrentRateFXViewmodel extends ChangeNotifier {
  final CurrentRateFXRepository currentrateFXRespository;
  final String _selectedItem1 = '';
  final String _selectedItem2 = '';
  LoadingStatus _fetchState = LoadingStatus.notfetched;
  LoadingStatus get fetchState => _fetchState;

  Convert? _convertedModel;
  CurrentRateFXViewmodel({required this.currentrateFXRespository});
  String get selectedItem1 => _selectedItem1;
  String get selectedItem2 => _selectedItem2;
  Convert? get convertModel => _convertedModel;

  Future<Convert?> getCurrencyConversion(
      {required String from,
      required String to,
      required String amount}) async {
    if (_convertedModel != null) {
      _fetchState = LoadingStatus.done;
      notifyListeners();
    } else {
      _fetchState = LoadingStatus.fetching;
      notifyListeners();
    }
    try {
      _convertedModel = await currentrateFXRespository.getFXConversion(
          from: from, to: to, amount: amount);
      if (_convertedModel != null) {
        _fetchState = LoadingStatus.done;
        notifyListeners();
      } else {
        _fetchState = LoadingStatus.notfetched;
        notifyListeners();
      }
      return _convertedModel;
    } catch (e) {
      _fetchState = LoadingStatus.error;
      _convertedModel = null;
      notifyListeners();

      return null;
    }
  }

  void clearData() {
    _convertedModel = null;
    notifyListeners();
  }
}

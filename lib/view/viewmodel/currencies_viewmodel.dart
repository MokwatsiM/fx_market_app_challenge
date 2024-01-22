import 'package:flutter/foundation.dart';

import 'package:fx_app_challenge/data/core/models/currency_list/currency_list.dart';
import 'package:fx_app_challenge/data/core/repository/fx_currencies/fx_currencies_repository.dart';
import 'package:fx_app_challenge/utils/loading.dart';

class FXCurrenciesViewmodel extends ChangeNotifier {
  final FXCurrenciesRepository fxCurrenciesRepository;

  LoadingStatus _fetchState = LoadingStatus.notfetched;
  LoadingStatus get fetchState => _fetchState;

  CurrencyList? _currencies;
  CurrencyList? get currency => _currencies;
  String _dropdownValue1 = '';
  String _dropdownValue2 = '';
  String get dropDownValue1 => _dropdownValue1;
  String get dropDownValue2 => _dropdownValue2;
  void setDropDownValue1({required String newDropDownvalue1}) {
    _dropdownValue1 = newDropDownvalue1;
    notifyListeners();
  }

  void setDropDownValue2({required String newDropDownvalue2}) {
    _dropdownValue2 = newDropDownvalue2;
    notifyListeners();
  }

  FXCurrenciesViewmodel({required this.fxCurrenciesRepository});

  Future<CurrencyList?> getFXCurrencies() async {
    if (_currencies != null) {
      _fetchState = LoadingStatus.done;
      notifyListeners();
    } else {
      _fetchState = LoadingStatus.fetching;
      notifyListeners();
    }
    try {
      _currencies = await fxCurrenciesRepository.getFXCurrencies();
      if (_currencies != null) {
        _fetchState = LoadingStatus.done;
        setDropDownValue1(
          newDropDownvalue1: _currencies!.currencies!.toMap().entries.first.key,
        );
        setDropDownValue2(
          newDropDownvalue2: _currencies!.currencies!.toMap().entries.last.key,
        );
        notifyListeners();
      } else {
        _fetchState = LoadingStatus.notfetched;
        notifyListeners();
      }
      return _currencies;
    } catch (e) {
      _fetchState = LoadingStatus.error;
      _currencies = null;
      notifyListeners();

      return null;
    }
  }
}

import 'package:fx_app_challenge/data/core/repository/fx_currencies/fx_currencies_repository.dart';
import 'package:fx_app_challenge/data/core/repository/fx_current_rate/current_rate_fx_repository.dart';
import 'package:fx_app_challenge/data/core/repository/fx_hostory_rates/fx_history_rate_repository.dart';
import 'package:fx_app_challenge/data/di/get_it_di.dart';
import 'package:fx_app_challenge/view/viewmodel/currencies_viewmodel.dart';
import 'package:fx_app_challenge/view/viewmodel/current_rate_fx_viewmodel.dart';
import 'package:fx_app_challenge/view/viewmodel/fx_history_rate_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> get allProviders {
    final List<SingleChildWidget> viewModelProviders = [
      ChangeNotifierProvider(
        create: (context) => CurrentRateFXViewmodel(
            currentrateFXRespository: getInstance<CurrentRateFXRepository>()),
      ),
      ChangeNotifierProvider(
        create: (context) => FXCurrenciesViewmodel(
            fxCurrenciesRepository: getInstance<FXCurrenciesRepository>()),
      ),
      ChangeNotifierProvider(
        create: (context) => FXHistoryRateViewmodel(
            fxHistoryRateRepositoy: getInstance<FXHistoryRateRepositoy>()),
      ),
    ];

    return [
      ...viewModelProviders,
    ];
  }
}

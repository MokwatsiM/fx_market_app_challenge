import 'package:dio/dio.dart';
import 'package:fx_app_challenge/data/api/api_client.dart';
import 'package:fx_app_challenge/data/api/api_constant.dart';
import 'package:fx_app_challenge/data/core/datasource/fx_currencies/fx_currencies_datasource.dart';
import 'package:fx_app_challenge/data/core/datasource/fx_currencies/fx_currencies_datasource_impl.dart';
import 'package:fx_app_challenge/data/core/datasource/fx_current_rate/current_rate_fx_datasource.dart';
import 'package:fx_app_challenge/data/core/datasource/fx_current_rate/current_rate_fx_datasource_impl.dart';
import 'package:fx_app_challenge/data/core/datasource/fx_history_rates/fx_history_rates_datasource.dart';
import 'package:fx_app_challenge/data/core/datasource/fx_history_rates/fx_history_rates_datasource_impl.dart';
import 'package:fx_app_challenge/data/core/repository/fx_currencies/fx_currencies_repository.dart';
import 'package:fx_app_challenge/data/core/repository/fx_currencies/fx_currencies_repository_impl.dart';

import 'package:fx_app_challenge/data/core/repository/fx_current_rate/current_rate_fx_repository.dart';
import 'package:fx_app_challenge/data/core/repository/fx_current_rate/current_rate_fx_repository_impl.dart';
import 'package:fx_app_challenge/data/core/repository/fx_hostory_rates/fx_history_rate_repository.dart';
import 'package:fx_app_challenge/data/core/repository/fx_hostory_rates/fx_history_rate_repository_impl.dart';
import 'package:get_it/get_it.dart';

final getInstance = GetIt.instance;
Future<void> init() async {
  final Dio dioClient = APIClient.getClient(ApiConstants.BASE_URL);
  getInstance.registerLazySingleton<CurrentFXRateDataSource>(
      () => CurrentFXRateDataSourceImpl(dioClient));
  getInstance.registerLazySingleton<CurrentRateFXRepository>(() =>
      CurrentrateFXRespositoryImpl(getInstance<CurrentFXRateDataSource>()));
  getInstance.registerLazySingleton<FXCurrenciesDataSource>(
      () => FxCurrenciesDataSourceImpl(dioClient));
  getInstance.registerLazySingleton<FXCurrenciesRepository>(
      () => FXCurrenciesRespositoryImpl(getInstance<FXCurrenciesDataSource>()));
  getInstance.registerLazySingleton<FXHistoryRatesDatasource>(
      () => FXHistoryRatesDatasourceImpl(dioClient));
  getInstance.registerLazySingleton<FXHistoryRateRepositoy>(() =>
      FXHistoryRateRepositoryImpl(getInstance<FXHistoryRatesDatasource>()));
}

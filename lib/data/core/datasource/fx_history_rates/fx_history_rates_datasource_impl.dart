import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fx_app_challenge/data/api/api_constant.dart';
import 'package:fx_app_challenge/data/core/datasource/fx_history_rates/fx_history_rates_datasource.dart';
import 'package:fx_app_challenge/data/core/models/fx_history.dart';
import 'package:fx_app_challenge/utils/date_comparison_helper.dart';
import 'package:fx_app_challenge/utils/date_extensions.dart';

class FXHistoryRatesDatasourceImpl extends FXHistoryRatesDatasource {
  final Dio _client;

  FXHistoryRatesDatasourceImpl(this._client);
  @override
  Future<List<FXHistory>?> getFXHistoryRatesDatasource(
      {required String currency}) async {
    try {
      final response = await _client.get(ApiConstants.CURRENCY_HISTORY_RATES,
          queryParameters: {
            "currency": currency,
            'end_date': DateComparisonHelper.checkWeekedn(date: DateTime.now())
                .toString()
                .formatDateToyMd,
            'start_date': DateComparisonHelper.checkWeekedn(
                    date: DateTime.now().subtract(const Duration(days: 30)))
                .toString()
                .formatDateToyMd,
            'format': 'close'
          },
          options: Options(
            responseType: ResponseType.plain,
          ));

     
      //
      if (response.data.contains('error')) {
        return throw DioException.badResponse(
            statusCode: 301,
            requestOptions: response.requestOptions,
            response: response);
      }
      //!important
      //The FXMarket API returns 'NaN' as a value for values for dates that are
      //public holidays and the currency did not trade
      //this condition caters for the :
      //because Dio cannot decode 'NaN' value we have to set the response type as plain/string
      // then we check if the string has 'NaN' value, if true we replace the value with a null value
      //then decode the string to a map and then to List<FXHistory>
      if (response.data.toString().contains('NaN')) {
        final newStr = response.data.toString().replaceAll('NaN', 'null');
        List<FXHistory> historyList = decodeToList(newStr);
        return historyList;
      } else {
        List<FXHistory> historyList = decodeToList(response.data);
        return historyList;
      }
    } on DioException catch (e) {
      log(e.message!.toLowerCase());
      return null;
    } catch (e) {
      return null;
    }
  }

  List<FXHistory> decodeToList(String newStr) {
    final data = json.decode(newStr);
    List<FXHistory> historyList = data['price'].entries.map<FXHistory>((entry) {
      return FXHistory(
          date: DateTime.parse(entry.key),
          weight: entry.value.entries.first.value);
    }).toList();
    return historyList;
  }
}

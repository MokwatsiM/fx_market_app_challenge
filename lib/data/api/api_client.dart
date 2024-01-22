import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fx_app_challenge/data/api/api_constant.dart';

mixin APIClient {
  static Dio getClient(
    String baseUrl,
  ) {
    return Dio()
      ..options = BaseOptions(baseUrl: baseUrl, queryParameters: {
        "api_key": ApiConstants.API_KEY,
      })
      ..interceptors.add(LogInterceptor(
        request: false,
        requestHeader: false,
        responseHeader: false,
        responseBody: true,
        requestBody: true,
        logPrint: (value) {
          log(value as String);
        },
      ));
  }
}

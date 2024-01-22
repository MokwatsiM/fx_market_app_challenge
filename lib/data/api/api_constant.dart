class ApiConstants {
  ApiConstants._();
  static const String BASE_URL = 'https://fxmarketapi.com';
  static const String CURRENCY_COMVERSION = '/apiconvert';
  static const String CURRENCY_LIST = '/apicurrencies';
  static const String CURRENCY_HISTORY_RATES = '/apitimeseries';
  //Not suppose to be hardcoded should be read locally in file thats in the gitignore
  //API key should be stored safe in a secure storage and read only when app is build
  static const String API_KEY = '7poL5D2JQLkbhyqzmNra';
}

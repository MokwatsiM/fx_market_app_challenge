import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'currencies.dart';

class CurrencyList extends Equatable {
  final Currencies? currencies;

  const CurrencyList({this.currencies});

  factory CurrencyList.fromMap(Map<String, dynamic> data) {
    Map<String, dynamic> newCurrencyMap = {};
    // because response includes 'USD' in all currencies, remove USD in all currency and replace with empty string
    if (data['currencies'] != null) {
      data['currencies'].keys.toList().forEach((String element) {
        newCurrencyMap.addAll(
            {element.replaceAll('USD', ''): data['currencies'][element]});
      });
    }
    return CurrencyList(
      currencies: Currencies.fromMap(newCurrencyMap),
    );
  }

  Map<String, dynamic> toMap() => {
        'currencies': currencies?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CurrencyList].
  factory CurrencyList.fromJson(String data) {
    return CurrencyList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CurrencyList] to a JSON string.
  String toJson() => json.encode(toMap());

  CurrencyList copyWith({
    Currencies? currencies,
  }) {
    return CurrencyList(
      currencies: currencies ?? this.currencies,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [currencies];
}

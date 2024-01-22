import 'package:flutter/material.dart';
import 'package:fx_app_challenge/view/viewmodel/currencies_viewmodel.dart';

class CurrencyDropDownButton extends StatelessWidget {
  final FXCurrenciesViewmodel fxCurrenciesViewmodel;
  final bool isDropdownButton1;
  const CurrencyDropDownButton({
    super.key,
    required this.fxCurrenciesViewmodel,
    required this.isDropdownButton1,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: isDropdownButton1
          ? fxCurrenciesViewmodel.dropDownValue1
          : fxCurrenciesViewmodel.dropDownValue2,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      underline: Container(
        height: 2,
        color: Colors.grey.shade400,
      ),
      onChanged: (String? newValue) {
        if (isDropdownButton1) {
          fxCurrenciesViewmodel.setDropDownValue1(newDropDownvalue1: newValue!);
        } else {
          fxCurrenciesViewmodel.setDropDownValue2(newDropDownvalue2: newValue!);
        }
      },
      items: fxCurrenciesViewmodel.currency!.currencies!
          .toMap()
          .entries
          .map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value.key,
          child: Text(value.key),
        );
      }).toList(),
    );
  }
}

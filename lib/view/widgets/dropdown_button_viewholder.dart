import 'package:flutter/material.dart';
import 'package:fx_app_challenge/view/viewmodel/currencies_viewmodel.dart';
import 'package:fx_app_challenge/view/widgets/currency_dropdown_button.dart';

class DropDownButtonsViewHolder extends StatelessWidget {
  final FXCurrenciesViewmodel fxCurrenciesViewmodel;
  const DropDownButtonsViewHolder({
    super.key,
    required this.fxCurrenciesViewmodel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CurrencyDropDownButton(
            fxCurrenciesViewmodel: fxCurrenciesViewmodel,
            isDropdownButton1: true,
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.swap_horiz)),
        Expanded(
          child: CurrencyDropDownButton(
            fxCurrenciesViewmodel: fxCurrenciesViewmodel,
            isDropdownButton1: false,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fx_app_challenge/view/viewmodel/currencies_viewmodel.dart';
import 'package:fx_app_challenge/view/viewmodel/current_rate_fx_viewmodel.dart';
import 'package:fx_app_challenge/view/widgets/currency_rates_display_container.dart';
import 'package:fx_app_challenge/view/widgets/dropdown_button_viewholder.dart';
import 'package:provider/provider.dart';

class CurrencyConversionRateCard extends StatelessWidget {
  final FXCurrenciesViewmodel fxCurrenciesViewmodel;
  const CurrencyConversionRateCard({
    super.key,
    required this.amountController,
    required this.formkey,
    required this.fxCurrenciesViewmodel,
  });

  final TextEditingController amountController;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Convert any currency',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20),
            TextFormField(
              autofocus: true,
              key: const ValueKey('amount'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter amount to convert';
                }
                return null;
              },
              controller: amountController,
              decoration: const InputDecoration(hintText: 'Enter Amount'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            DropDownButtonsViewHolder(
              fxCurrenciesViewmodel: fxCurrenciesViewmodel,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  Provider.of<CurrentRateFXViewmodel>(context, listen: false)
                      .clearData();
                  Provider.of<CurrentRateFXViewmodel>(context, listen: false)
                      .getCurrencyConversion(
                          amount: amountController.text,
                          to: fxCurrenciesViewmodel.dropDownValue2,
                          from: fxCurrenciesViewmodel.dropDownValue1);
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
              child: const Text(
                'Convert',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(height: 10),
            CurrencyRatesDisplayContainer(
              amountController: amountController,
            )
          ],
        ),
      ),
    );
  }
}

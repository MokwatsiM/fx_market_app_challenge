import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:fx_app_challenge/utils/loading.dart';
import 'package:fx_app_challenge/view/viewmodel/current_rate_fx_viewmodel.dart';
import 'package:provider/provider.dart';

class CurrencyRatesDisplayContainer extends StatelessWidget {
  final TextEditingController amountController;
  const CurrencyRatesDisplayContainer(
      {super.key, required this.amountController});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 38,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Consumer<CurrentRateFXViewmodel>(
        builder: (BuildContext context, CurrentRateFXViewmodel viewmodel, _) {
          return _checkStatus(viewmodel, context, amountController);
        },
      ),
    );
  }

  Widget _checkStatus(CurrentRateFXViewmodel viewmodel, BuildContext context,
      TextEditingController amountController) {
    return ConditionalSwitch.single<LoadingStatus>(
      context: context,
      valueBuilder: (BuildContext context) => viewmodel.fetchState,
      caseBuilders: {
        LoadingStatus.fetching: (BuildContext context) =>
            const Center(child: CircularProgressIndicator()),
        LoadingStatus.notfetched: (BuildContext context) => const SizedBox(),
        LoadingStatus.done: (BuildContext context) {
          return Text(
            '${amountController.text} ${viewmodel.convertModel!.from} = ${viewmodel.convertModel!.total} ${viewmodel.convertModel!.to}',
            style: const TextStyle(),
          );
        },
        LoadingStatus.error: (BuildContext context) =>
            const Text("an error occured"),
      },
      fallbackBuilder: (BuildContext context) => const SizedBox(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fx_app_challenge/utils/loading.dart';
import 'package:fx_app_challenge/view/viewmodel/currencies_viewmodel.dart';
import 'package:fx_app_challenge/view/viewmodel/current_rate_fx_viewmodel.dart';
import 'package:fx_app_challenge/view/widgets/currency_conversion_rate.dart';
import 'package:fx_app_challenge/view/widgets/historical_graph.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController amountController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<FXCurrenciesViewmodel>(context, listen: false)
          .getFXCurrencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('FX Rate App'),
      ),
      body: Consumer<FXCurrenciesViewmodel>(builder: (BuildContext context,
          FXCurrenciesViewmodel fxCurrenciesViewmodel, _) {
        if (fxCurrenciesViewmodel.fetchState == LoadingStatus.fetching) {
          return const Center(child: CircularProgressIndicator());
        } else if (fxCurrenciesViewmodel.fetchState == LoadingStatus.done) {
          return Column(
            children: [
              Form(
                  key: formkey,
                  child: CurrencyConversionRateCard(
                      amountController: amountController,
                      formkey: formkey,
                      fxCurrenciesViewmodel: fxCurrenciesViewmodel)),
              Consumer<CurrentRateFXViewmodel>(builder:
                  (BuildContext context, CurrentRateFXViewmodel viewmodel, _) {
                return viewmodel.convertModel != null
                    ? HistoricalGraph(
                        currencyCombination:
                            fxCurrenciesViewmodel.dropDownValue1 +
                                fxCurrenciesViewmodel.dropDownValue2,
                      )
                    : const SizedBox();
              })
            ],
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}

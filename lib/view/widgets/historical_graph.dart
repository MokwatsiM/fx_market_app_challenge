import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fx_app_challenge/data/core/models/fx_history.dart';
import 'package:fx_app_challenge/utils/loading.dart';
import 'package:fx_app_challenge/view/viewmodel/fx_history_rate_viewmodel.dart';
import 'package:fx_app_challenge/view/widgets/fx_historical_rates_chart.dart';
import 'package:provider/provider.dart';

class HistoricalGraph extends StatefulWidget {
  final String currencyCombination;
  const HistoricalGraph({super.key, required this.currencyCombination});

  @override
  State<HistoricalGraph> createState() => _HistoricalGraphState();
}

class _HistoricalGraphState extends State<HistoricalGraph> {
  List<FXHistory>? newRates;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<FXHistoryRateViewmodel>(context, listen: false).clear();
      Provider.of<FXHistoryRateViewmodel>(context, listen: false)
          .getFXHistoryRates(currency: widget.currencyCombination);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FXHistoryRateViewmodel>(
      builder: (BuildContext context, FXHistoryRateViewmodel viewModel, _) {
        if (viewModel.fetchState == LoadingStatus.done) {
          newRates = viewModel.rates;
          return Column(
            children: [
              Text(
                '${widget.currencyCombination} for last 30 days',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              FXHistoricalRatesChart(
                fxHistoryRateViewmodel: viewModel,
              ),
            ],
          );
        } else if (viewModel.fetchState == LoadingStatus.notfetched) {
          return const SizedBox.shrink();
        } else if (viewModel.fetchState == LoadingStatus.error) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                  'Something went wrong we could not retrieve data,\nChoose different pair currency to show historic FX Changes',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0,
                      fontSize: 16.0)),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

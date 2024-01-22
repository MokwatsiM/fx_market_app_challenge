import 'package:flutter/material.dart';
import 'package:fx_app_challenge/data/core/models/fx_history.dart';
import 'package:fx_app_challenge/view/viewmodel/fx_history_rate_viewmodel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FXHistoricalRatesChart extends StatelessWidget {
  final FXHistoryRateViewmodel fxHistoryRateViewmodel;
  const FXHistoricalRatesChart({
    super.key,
    required this.fxHistoryRateViewmodel,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        backgroundColor: Colors.white,
        primaryYAxis: const NumericAxis(),
        primaryXAxis: const DateTimeAxis(
            title: AxisTitle(
                text: 'Date',
                textStyle:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
            majorGridLines: MajorGridLines(width: 0),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            intervalType: DateTimeIntervalType.days),
        series: <LineSeries<FXHistory, DateTime>>[
          LineSeries<FXHistory, DateTime>(
            color: Colors.red,
            dataSource: fxHistoryRateViewmodel.rates,
            xValueMapper: (FXHistory fxHistory, _) => fxHistory.date,
            yValueMapper: (FXHistory fxHistory, _) => fxHistory.weight,
            name: 'FX Changes',
          )
        ]);
  }
}

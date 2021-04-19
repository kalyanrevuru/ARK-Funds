import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      behaviors: [
        charts.SlidingViewport(
          charts.SelectionModelType.action,
        ),
        charts.PanBehavior(),
      ],
      selectionModels: [
        new charts.SelectionModelConfig(
            changedListener: (charts.SelectionModel model) {
          print(
            model.selectedSeries[0].measureFn(model.selectedDatum[0].index),
          );
        })
      ],
      primaryMeasureAxis: new charts.NumericAxisSpec(
        tickProviderSpec: new charts.StaticNumericTickProviderSpec(
          <charts.TickSpec<num>>[
            charts.TickSpec<num>(110),
            charts.TickSpec<num>(112),
            charts.TickSpec<num>(114),
            charts.TickSpec<num>(116),
            charts.TickSpec<num>(118),
            charts.TickSpec<num>(120),
            charts.TickSpec<num>(122),
            charts.TickSpec<num>(124),
            charts.TickSpec<num>(126),
            charts.TickSpec<num>(128),
            charts.TickSpec<num>(130),
          ],
        ),
      ),
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
    );
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}

import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String date;
  double prediction;
  charts.Color color;

  BarChartModel({
    this.date,
    this.prediction,
    this.color,
  });
}
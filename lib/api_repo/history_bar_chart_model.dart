import 'package:charts_flutter/flutter.dart' as charts;

class HBarChartModel {
  String date;
  double humidity;
  charts.Color color;

  HBarChartModel({
    this.date,
    this.humidity,
    this.color,
  });
}
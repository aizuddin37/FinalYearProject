import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'bar_chart_model.dart';

class BarChartGraph extends StatefulWidget {
   List<BarChartModel> data;

   BarChartGraph({Key key, this.data}) : super(key: key);

  @override
  _BarChartGraphState createState() => _BarChartGraphState();
}

class _BarChartGraphState extends State<BarChartGraph> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
          id: "Weather Prediction",
          data: widget.data,
          domainFn: (BarChartModel series, _) => series.date,
          measureFn: (BarChartModel series, _) => series.prediction,
          colorFn: (BarChartModel series, _) => series.color),
    ];
    print("in BarChartGraph " + widget.data.toString());


    // bool flip = true;
    // if (widget.data != null){
    //   flip = (widget.data.length > 10 )? false : true;
    // }
    return widget.data != null ? Container(child: charts.BarChart(series, animate: true, vertical: false,)) :  Container();
  }
}
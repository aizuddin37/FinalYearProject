import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:justmarryapp/api_repo/history_bar_chart_model.dart';
import 'bar_chart_model.dart';

class HBarChartGraph extends StatefulWidget {
  List<HBarChartModel> data;

  HBarChartGraph({Key key, this.data}) : super(key: key);

  @override
  _HBarChartGraphState createState() => _HBarChartGraphState();
}

class _HBarChartGraphState extends State<HBarChartGraph> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<HBarChartModel, String>> series = [
      charts.Series(
          id: "Weather History",
          data: widget.data,
          domainFn: (HBarChartModel series, _) => series.date,
          measureFn: (HBarChartModel series, _) => series.humidity,
          colorFn: (HBarChartModel series, _) => series.color),
    ];
    print("in BarChartGraph " + widget.data.toString());


    // bool flip = true;
    // if (widget.data != null){
    //   flip = (widget.data.length > 10 )? false : true;
    // }
    return widget.data != null ? Container(child: charts.BarChart(series, animate: true, vertical: false,)) :  Container();
  }
}
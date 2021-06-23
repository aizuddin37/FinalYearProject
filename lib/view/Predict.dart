import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:justmarryapp/api_repo/WeatherPredict.dart';

class ChartPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChartPagesState();
}

class ChartPagesState extends State<ChartPages> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;
  List<WeatherPredict> fromJson(strJson){
    final data = jsonDecode(strJson);
    return List<WeatherPredict>.from(data.map((i) => WeatherPredict.fromJson(i)));
  }
  List<WeatherPredict> predict =[];
  Future<List<WeatherPredict>> getdata() async{
    List<WeatherPredict> list =[];
    final response =
    await http.get(Uri.parse("http://192.168.68.114:83/justmarry/api/check_selangor"));
    if (response.statusCode == 200){
      list = fromJson(response.body);
    }
    return list;
  }
  static List<charts.Series<WeatherPredict,String>> chartData(List<WeatherPredict> data){
    return [charts.Series<WeatherPredict,String>(
      id:'Prediction',
      domainFn: (WeatherPredict w, _) => w.Datetime.toString(),
      measureFn: (WeatherPredict w, _) => w.Predictions,

      data:  data


    )
    ];
  }


  int touchedGroupIndex = -1;

  @override
  void initState() {
    getdata().then((value) => predict = value );
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("woo"),),
      body: Card(
        child: charts.BarChart(
          chartData(predict),
          animate: true,
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColor],
        width: width,
      ),
      BarChartRodData(
        y: y2,
        colors: [rightBarColor],
        width: width,
      ),
    ]);
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
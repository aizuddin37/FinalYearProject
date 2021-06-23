import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:justmarryapp/api_repo/WeatherPredict.dart';
import 'package:dio/dio.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:justmarryapp/api_repo/bar_chart_graph.dart';
import 'package:justmarryapp/api_repo/bar_chart_model.dart';

class ChartPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChartPagesState();
}

class ChartPagesState extends State<ChartPages> {
  final startDateCtrl = TextEditingController();
  final endDateCtrl = TextEditingController();
  String data = "No data";
  String startDate = '2021-10-10';
  String endDate = '2021-10-15';
  List<WeatherPredict> listWeatherPredit;
  List<BarChartModel> listModel;

  @override
  void initState() {
    super.initState();
    startDateCtrl.text = startDate;
    endDateCtrl.text = endDate;
    getData().then((value) => listWeatherPredit = value);
  }

  Future<List<WeatherPredict>> getData() async {
    try {
      List<WeatherPredict> tempList = [];

      var response = await Dio().get(
          "http://13.228.175.39:89/justmarry/api/check_selangor?startDate=" +
              startDateCtrl.text +
              "&endDate=" +
              endDateCtrl.text);
      print("/nResponse : " + response.toString());

      // change this
      final List<dynamic> body = response.data;
      for (var data in body) {
        tempList.add(WeatherPredict.fromJson(data));
      }

      print("done converting to List<WeatherPredict> ");
      data = "";
      tempList.forEach((item) {
        data = data + item.dateTime + " - " + item.prediction.toString() + "\n";
      });
      print("done getting data item ");

      // get bar chart model list from the weatherpredict list
      listModel = convertToBarChartModel(tempList);

      return tempList;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("woo"),
        ),
        body: Container(
          child: Column(
            children: [
              TextField(
                controller: startDateCtrl,
              ),
              TextField(
                controller: endDateCtrl,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  getData().then((value) {
                    setState(() {
                      listWeatherPredit = value;
                      listModel = convertToBarChartModel(listWeatherPredit);
                    });
                  });
                },
                child: Text('Get Data'),
              ),
              Container(
                child: Text(data),
              ),
              Center(
                child: Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [BarChartGraph(
                      data: listModel,
                    ),]
                  ),
                ),
              ),
              Container(
                child: Text(data),
              ),
            ],
          ),
        ));
  }

  List<BarChartModel> convertToBarChartModel(List<WeatherPredict> list){
    List<BarChartModel> listModel = [];
    list.forEach((predict) {
      BarChartModel newitem = BarChartModel();
      newitem.date = predict.dateTime;
      newitem.prediction = predict.prediction;
      newitem.color = charts.ColorUtil.fromDartColor(Colors.green);
      listModel.add(newitem);
    });
    return listModel;
  }
}

// final List<BarChartModel> data = [
//   BarChartModel(
//     year: "2014",
//     financial: 250,
//     color: charts.ColorUtil.fromDartColor
//       (Color(0xFF47505F)),
//   ),
//   BarChartModel(
//     year: "2015",
//     financial: 300,
//     color: charts.ColorUtil.fromDartColor
//       (Colors.red),
//   ),
// ];

// class BarChartModel {
//   String date;
//   double prediction;
//    charts.Color color;
//
//   BarChartModel({
//     this.date,
//     this.prediction,
//     this.color,
//   });
// }

// child: charts.BarChart(
// chartData(predict),
// animate: true,
// ),

// Widget makeTransactionsIcon() {
//   const width = 4.5;
//   const space = 3.5;
//   return Row(
//     mainAxisSize: MainAxisSize.min,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: <Widget>[
//       Container(
//         width: width,
//         height: 10,
//         color: Colors.white.withOpacity(0.4),
//       ),
//       const SizedBox(
//         width: space,
//       ),
//       Container(
//         width: width,
//         height: 28,
//         color: Colors.white.withOpacity(0.8),
//       ),
//       const SizedBox(
//         width: space,
//       ),
//       Container(
//         width: width,
//         height: 42,
//         color: Colors.white.withOpacity(1),
//       ),
//       const SizedBox(
//         width: space,
//       ),
//       Container(
//         width: width,
//         height: 28,
//         color: Colors.white.withOpacity(0.8),
//       ),
//       const SizedBox(
//         width: space,
//       ),
//       Container(
//         width: width,
//         height: 10,
//         color: Colors.white.withOpacity(0.4),
//       ),
//     ],
//   );
// }

// BarChartGroupData makeGroupData(int x, double y1, double y2) {
//   return BarChartGroupData(barsSpace: 4, x: x, barRods: [
//     BarChartRodData(
//       y: y1,
//       colors: [leftBarColor],
//       width: width,
//     ),
//     BarChartRodData(
//       y: y2,
//       colors: [rightBarColor],
//       width: width,
//     ),
//   ]);
// }

// final Color leftBarColor = const Color(0xff53fdd7);
// final Color rightBarColor = const Color(0xffff5182);
// final double width = 7;
//
// List<BarChartGroupData> rawBarGroups;
// List<BarChartGroupData> showingBarGroups;
// List<WeatherPredict> fromJson(strJson){
//   final data = jsonDecode(strJson);
//   return List<WeatherPredict>.from(data.map((i) => WeatherPredict.fromJson(i)));
// }
// List<WeatherPredict> predict =[];
// Future<List<WeatherPredict>> getdata() async{
//   List<WeatherPredict> list =[];
//   final response =
//   await http.get(Uri.parse("http://192.168.68.114:83/justmarry/api/check_selangor"));
//   if (response.statusCode == 200){
//     list = fromJson(response.body);
//   }
//   return list;
// }
// static List<charts.Series<WeatherPredict,String>> chartData(List<WeatherPredict> data){
//   return [charts.Series<WeatherPredict,String>(
//     id:'Prediction',
//     domainFn: (WeatherPredict w, _) => w.Datetime.toString(),
//     measureFn: (WeatherPredict w, _) => w.Predictions,
//
//     data:  data
//
//
//   )
//   ];
// }
//
//
// int touchedGroupIndex = -1;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:justmarryapp/help/ui.dart';
import 'package:justmarryapp/model/current_weather_data.dart';
import 'package:justmarryapp/model/five_days_data.dart';
import 'package:justmarryapp/router.dart';
import 'package:justmarryapp/shared/weather_binding.dart';
import 'package:justmarryapp/shared/weather_controller.dart';
import 'package:justmarryapp/view/loginpage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeatherPage2 extends StatefulWidget {
  const WeatherPage2({key}) : super(key: key);

  @override
  State<WeatherPage2> createState() => _WeatherPage2State();
}

class _WeatherPage2State extends State<WeatherPage2> {
  int _selectedIndex = 0;
  int index = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    WeatherPage2(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _widgetOptions[_selectedIndex];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<WeatherController>(
        builder: (controller) => Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/wed.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.blueGrey,
                          ),
                          onPressed: () {
                            Get.toNamed('drawer');
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 70, left: 20, right: 20),
                      child: TextField(
                        onChanged: (value) => controller.city = value,
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => controller.updateWeather(),
                        decoration: InputDecoration(
                          suffix: Icon(
                            Icons.search,
                            color: Colors.blueGrey,
                          ),
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          hintText: 'Search'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.0, 1.0),
                      child: SizedBox(
                        height: 100,
                        width: 10,
                        child: OverflowBox(
                          minWidth: 0.0,
                          maxWidth: MediaQuery.of(context).size.width,
                          minHeight: 0.0,
                          maxHeight:
                          300, // (MediaQuery.of(context).size.height / 4),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                width: double.maxFinite,
                                height: double.maxFinite,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 15, left: 10, right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            //Display of the current data that is search for
                                            Center(
                                              child: Text(
                                                (controller.currentWeatherData !=
                                                    null)
                                                    ? '${controller.currentWeatherData.name}'
                                                    .toUpperCase()
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontFamily:
                                                  'flutterfonts',
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                DateFormat()
                                                    .add_MMMMEEEEd()
                                                    .format(DateTime.now()),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 8,
                                                  fontFamily:
                                                  'flutterfonts',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(left: 50),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  (controller.currentWeatherData
                                                      .weather !=
                                                      null)
                                                      ? '${controller.currentWeatherData.weather[0].description}'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 16,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  (controller.currentWeatherData
                                                      .main !=
                                                      null)
                                                      ? '${(controller.currentWeatherData.main.temp - 273.15).round().toString()}\u2103'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline2
                                                      .copyWith(
                                                      color: Colors.black45,
                                                      fontFamily:
                                                      'flutterfonts'),
                                                ),
                                                Text(
                                                  (controller.currentWeatherData
                                                      .main !=
                                                      null)
                                                      ? 'min: ${(controller.currentWeatherData.main.tempMin - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main.tempMax - 273.15).round().toString()}\u2103'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 8,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  width: 70,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/icon-01.jpg'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    (controller.currentWeatherData
                                                        .wind !=
                                                        null)
                                                        ? 'wind ${controller.currentWeatherData.wind.speed} m/s'
                                                        : '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 10,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      'flutterfonts',
                                                    ),
                                                  ),
                                                ),
                                                // Text(
                                                //   "Click here for more",
                                                //   style: TextStyle(
                                                //     color: Colors.black45,
                                                //     fontSize: 8,
                                                //     fontWeight:
                                                //     FontWeight.bold,
                                                //     fontFamily:
                                                //     'flutterfonts',
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            UIHelper.verticalSpaceMedium(),
            UIHelper.verticalSpaceLarge(),
            Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: EdgeInsets.only(top: 40),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'other city'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                      fontSize: 10,
                                      fontFamily: 'flutterfonts',
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    child: Text(
                                      'More info on Predictions'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                        fontSize: 10,
                                        fontFamily: 'flutterfonts',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {
                                      Get.toNamed('list');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            //Using Card to display the data of other cities
                            Container(
                              height: 70,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    VerticalDivider(
                                      color: Colors.transparent,
                                      width: 5,
                                    ),
                                itemCount: controller.dataList.length,
                                itemBuilder: (context, index) {
                                  CurrentWeatherData data;
                                  (controller.dataList.length > 0)
                                      ? data = controller.dataList[index]
                                      : data = null;
                                  return Container(
                                    width: 90,
                                    height: 100,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          switch (data.name) {
                                            case "Selangor":
                                              {
                                                Get.toNamed('websel');
                                              }
                                              break;
                                            case "Johor Bahru":
                                              {
                                                Get.toNamed('webjb');
                                              }
                                              break;
                                            case "Penang":
                                              {
                                                Get.toNamed('webpin');
                                              }
                                              break;
                                            case "Kuala Terengganu":
                                              {
                                                Get.toNamed('webkt');
                                              }
                                              break;
                                            case "Kota Bharu":
                                              {
                                                Get.toNamed('webkb');
                                              }
                                              break;
                                          }
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              (data != null)
                                                  ? '${data.name}'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                fontSize: 8,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts',
                                              ),
                                            ),
                                            Text(
                                              (data != null)
                                                  ? '${(data.main.temp - 273.15).round().toString()}\u2103'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                fontSize: 8,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts',
                                              ),
                                            ),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/icon-01.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              (data != null)
                                                  ? '${data.weather[0].description}'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts',
                                                fontSize: 8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            //Display Line Chart of the forecast that is predicted for the next five days
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'forecast next 5 days'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  Icon(
                                    Icons.next_plan_outlined,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 165,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  series: <ChartSeries<FiveDayData, String>>[
                                    SplineSeries<FiveDayData, String>(
                                      dataSource: controller.fiveDaysData,
                                      xValueMapper: (FiveDayData f, _) =>
                                      f.dateTime,
                                      yValueMapper: (FiveDayData f, _) =>
                                      f.temp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //
      //
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.sun_max_fill),
      //       label: 'Weather',
      //
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.doc_append),
      //       label: 'Book',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}





import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:justmarryapp/model/current_weather_data.dart';
import 'package:justmarryapp/model/five_days_data.dart';
import 'package:justmarryapp/service/weather_service.dart';

class WeatherController extends GetxController{
  String city;
  String searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  WeatherController({@required this.city});

  @override

  Future<void> onInit() async {
    initState();
    getTopFiveCities();
    super.onInit();
  }
  void updateWeather() {
    initState();
  }
  void initState(){
    getCurrentWeatherData();
    getFiveDaysData();

  }
  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) => {
          print(error),
          update(),
        });
  }

  void getTopFiveCities() {
    List<String> cities = ['Selangor', 'Johor Bahru', 'Pulau Pinang', 'Kuala Terengganu', 'Kota Bahru'];

    cities.forEach((c) {
      WeatherService(city: '$c').getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    });
  }


  void getFiveDaysData() {
    WeatherService(city: '$city').getFiveDaysThreeHoursForecastData(
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        }, onError: (error) {
      print(error);
      update();
    });
  }

}
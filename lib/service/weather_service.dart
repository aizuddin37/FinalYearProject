import 'package:flutter/foundation.dart';
import 'package:justmarryapp/api_repo/api_repo.dart';
import 'package:justmarryapp/model/current_weather_data.dart';
import 'package:justmarryapp/model/five_days_data.dart';


class WeatherService {
  final String city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=88373ca0b5969c4e4426f10401a5cdac';

  WeatherService({@required this.city});

  void getCurrentWeatherData({
    Function() beforSend,
    Function(CurrentWeatherData currentWeatherData) onSuccess,
    Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    //print(url);
    ApiRepo(url: '$url', payload: null).get(
        beforeSend: () => {
          if (beforSend != null)
            {
              beforSend(),
            },
        },
        onSuccess: (data) => {
          onSuccess(CurrentWeatherData.fromJson(data)),
        },
        onError: (error) => {
          if (onError != null)
            {
              print(error),
              onError(error),
            }
        });
  }

  void getFiveDaysThreeHoursForecastData({
    Function() beforeSend,
    Function(List<FiveDayData> fiveDayData) onSuccess,
    Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    ApiRepo(url: '$url', payload: null).get(
        beforeSend: () => {},
        onSuccess: (data) => {
          onSuccess((data['list'] as List)
              ?.map((t) => FiveDayData.fromJson(t))
              ?.toList() ??
              List.empty()),
        },
        onError: (error) => {
          print(error),
          onError(error),
        });
  }
}

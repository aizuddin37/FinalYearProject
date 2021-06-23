class WeatherPredict {

  String namep;
  String Datetime;
  double Predictions,Trends,season_yearly,season_weekly;




  WeatherPredict({this.namep,
    this.Datetime,
    this.Predictions,
    this.Trends,
    this.season_yearly,
    this.season_weekly,




  });

  WeatherPredict.fromJson(Map<String, dynamic> data)
      : namep = data['Name'],
        Datetime = data['Date time'],
        Predictions = data['Predictions'],
        Trends = data['Trends'],
        season_yearly = data['season_yearly'],
        season_weekly = data['season_weekly'];

}
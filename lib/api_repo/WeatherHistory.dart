class WeatherHistory {

  String Name;
  String Datetime;
  String Conditions;
  double MaxTemp,Temp,Heat,Pcp,WindS,WindD,WindG,Visibility,Cloud,Humidity;
  int MinTemp;



  WeatherHistory({this.Name,
    this.Datetime,
    this.MaxTemp,
    this.MinTemp,
    this.Temp,
    this.Heat,
    this.Pcp,
    this.WindS,
    this.WindD,
    this.Visibility,
    this.Cloud,
    this.Humidity,
    this.Conditions,



  });

  WeatherHistory.fromJson(Map<String, dynamic> data)
      : Name = data['Name'],
        Datetime = data['Date time'],
        MaxTemp = data['Maximum Temperature'],
        MinTemp = data['Minimum Temperature'],
        Temp = data['Temperature'],
        Heat = data['Heat Index'],
        Pcp = data['Precipitation'],
        WindS = data['Wind Speed'],
        WindD = data['Wind Direction'],
        WindG = data['Wind Gust'],
        Visibility = data['Visibility'],
        Cloud = data['Cloud Cover'],
        Humidity = data['Relative Humidity'],
        Conditions = data['Conditions'];

}
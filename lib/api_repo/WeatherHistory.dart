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

  WeatherHistory.fromJson(Map<String, dynamic> json)
      : Name = json['Name'],
        Datetime = json['Date time'],
        MaxTemp = json['Maximum Temperature'],
        MinTemp = json['Minimum Temperature'],
        Temp = json['Temperature'],
        Heat = json['Heat Index'],
        Pcp = json['Precipitation'],
        WindS = json['Wind Speed'],
        WindD = json['Wind Direction'],
        WindG = json['Wind Gust'],
        Visibility = json['Visibility'],
        Cloud = json['Cloud Cover'],
        Humidity = json['Relative Humidity'],
        Conditions = json['Conditions'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date_time'] = this.Datetime;
    data['Maximum Temperature'] = this.MaxTemp;
    data['Minimum Temperature'] = this.MinTemp;
    data['Temperature'] = this.Temp;
    data['Heat Index'] = this.Heat;
    data['Precipitation'] = this.Pcp;
    data['Wind Speed'] = this.WindS;
    data['Wind Direction'] = this.WindD;
    data['Wind Gust'] = this.WindG;
    data['Visibility'] = this.Visibility;
    data['Cloud Cover'] = this.Cloud;
    data['Relative Humidity'] = this.Humidity;
    data['Conditions'] = this.Conditions;
    return data;
  }

}
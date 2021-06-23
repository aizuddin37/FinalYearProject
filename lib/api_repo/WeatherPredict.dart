class WeatherPredict {
  String dateTime;
  String name;
  double prediction;
  double trends;
  int id;
  double seasonWeekly;
  double seasonYearly;

  WeatherPredict(
      {this.dateTime,
        this.name,
        this.prediction,
        this.trends,
        this.id,
        this.seasonWeekly,
        this.seasonYearly});

  WeatherPredict.fromJson(Map<String, dynamic> json) {
    dateTime = json['Date_time'];
    name = json['Name'];
    prediction = json['Prediction'];
    trends = json['Trends'];
    id = json['id'];
    seasonWeekly = json['season_weekly'];
    seasonYearly = json['season_yearly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date_time'] = this.dateTime;
    data['Name'] = this.name;
    data['Prediction'] = this.prediction;
    data['Trends'] = this.trends;
    data['id'] = this.id;
    data['season_weekly'] = this.seasonWeekly;
    data['season_yearly'] = this.seasonYearly;
    return data;
  }
}
class Measure{
  final String dateTime;
  final int temp;
  final String name;
  final double speed;
  final int deg;

  Measure({this.dateTime,this.temp,this.name,this.speed,this.deg});


  factory Measure.fromJson(dynamic json){
    if(json ==null){
      return Measure();
    }


    var f = json['dt_txt'].split(' ')[0].split('-')[2];
    var l = json['dt_txt'].split(' ')[1].split(':')[0];
    var fandl = '$f-$l';
    return Measure(
      dateTime: '$fandl',
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
      name: json['name'],
      speed: double.parse(json['speed'].toString()),
      deg: json['deg'],

    );
  }

}
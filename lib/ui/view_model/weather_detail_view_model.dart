import 'dart:ui';

class WeatherDetailViewModel {
  int? id;
  String? name;
  int? temp;
  int? tempMin;
  int? tempMax;
  String? weatherIcon;
  String? weatherCondition;
  Color? color;
  DateTime? dateTime;

  WeatherDetailViewModel({
    this.id,
    this.name,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.weatherIcon,
    this.weatherCondition,
    this.color,
    this.dateTime,
  });
}

import 'dart:ui';

class WeatherDetailViewModel {
  int? id;
  String? name;
  double? temp;
  double? tempMin;
  double? tempMax;
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

import 'dart:ui';

class WeatherDetailViewModel {
  int? id;
  String? name;
  String? countryName;
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
    this.countryName,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.weatherIcon,
    this.weatherCondition,
    this.color,
    this.dateTime,
  });
}

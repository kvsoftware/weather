import 'dart:ui';

class WeatherDetailViewModel {
  String id;
  String name;
  String countryName;
  int temp;
  int tempMin;
  int tempMax;
  String weatherIcon;
  String weatherCondition;
  Color color;
  DateTime dateTime;

  WeatherDetailViewModel({
    required this.id,
    required this.name,
    required this.countryName,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weatherIcon,
    required this.weatherCondition,
    required this.color,
    required this.dateTime,
  });
}

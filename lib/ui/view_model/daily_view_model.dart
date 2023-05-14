import 'dart:ui';

class DailyViewModel {
  int tempMin;
  int tempMax;
  int weatherCode;
  String weatherIconPath;
  String weatherCondition;
  DateTime dt;

  DailyViewModel({
    required this.tempMin,
    required this.tempMax,
    required this.weatherCode,
    required this.weatherIconPath,
    required this.weatherCondition,
    required this.dt,
  });
}

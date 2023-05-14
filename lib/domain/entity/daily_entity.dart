class DailyEntity {
  int tempMin;
  int tempMax;
  int weatherCode;
  String weatherIconPath;
  String weatherCondition;
  DateTime dt;

  DailyEntity({
    required this.tempMin,
    required this.tempMax,
    required this.weatherCode,
    required this.weatherIconPath,
    required this.weatherCondition,
    required this.dt,
  });
}

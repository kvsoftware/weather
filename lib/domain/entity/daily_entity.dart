class DailyEntity {
  int tempMin;
  int tempMax;
  int weatherCode;
  String weatherIcon;
  String weatherCondition;
  DateTime dt;

  DailyEntity({
    required this.tempMin,
    required this.tempMax,
    required this.weatherCode,
    required this.weatherIcon,
    required this.weatherCondition,
    required this.dt,
  });
}

class HourlyEntity {
  int temp;
  int weatherCode;
  String weatherIconPath;
  String weatherCondition;
  DateTime dt;

  HourlyEntity({
    required this.temp,
    required this.weatherCode,
    required this.weatherIconPath,
    required this.weatherCondition,
    required this.dt,
  });
}

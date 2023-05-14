class HourlyEntity {
  int temp;
  int weatherCode;
  String weatherIconPath;
  DateTime dt;

  HourlyEntity({
    required this.temp,
    required this.weatherCode,
    required this.weatherIconPath,
    required this.dt,
  });
}

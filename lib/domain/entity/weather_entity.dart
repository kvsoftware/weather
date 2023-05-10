class WeatherEntity {
  String countryCode;
  double lat;
  double lon;
  double temp;
  double tempMin;
  double tempMax;
  int weatherCode;
  String weatherIcon;
  String weatherCondition;
  DateTime dt;

  WeatherEntity({
    required this.countryCode,
    required this.lat,
    required this.lon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weatherCode,
    required this.weatherIcon,
    required this.weatherCondition,
    required this.dt,
  });
}

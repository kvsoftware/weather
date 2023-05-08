class WeatherEntity {
  int? id;
  String? name;
  String? countryCode;
  double? lat;
  double? lon;
  double? temp;
  double? tempMin;
  double? tempMax;
  int? weatherCode;
  String? weatherIcon;
  String? weatherCondition;
  DateTime? dt;

  WeatherEntity({
    this.id,
    this.name,
    this.countryCode,
    this.lat,
    this.lon,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.weatherCode,
    this.weatherIcon,
    this.weatherCondition,
    this.dt,
  });
}

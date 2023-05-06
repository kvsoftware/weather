class ForecastWeatherEntity {
  int? temp;
  int? tempMin;
  int? tempMax;
  String? dateTime;
  String? weatherIconPath;
  String? weatherCondition;

  ForecastWeatherEntity({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.dateTime,
    this.weatherIconPath,
    this.weatherCondition,
  });
}

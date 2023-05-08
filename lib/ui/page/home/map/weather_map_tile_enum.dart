enum WeatherMapTileEnum {
  clouds,
  precipitation,
  pressure,
  wind,
  temp,
}

extension WeatherMapTileExtension on WeatherMapTileEnum {
  String get value {
    switch (this) {
      case WeatherMapTileEnum.clouds:
        return 'clouds_new';
      case WeatherMapTileEnum.precipitation:
        return 'precipitation_new';
      case WeatherMapTileEnum.pressure:
        return 'pressure_new';
      case WeatherMapTileEnum.wind:
        return 'wind_new';
      case WeatherMapTileEnum.temp:
        return 'temp_new';
    }
  }
}

enum WeatherMapTileEnum {
  clouds,
  precipitation,
  pressure,
  wind,
  temp,
}

const String cloudsMapTile = "clouds_new";
const String precipitationMapTile = "precipitation_new";
const String pressureMapTile = "pressure_new";
const String windMapTile = "wind_new";
const String tempMapTile = "temp_new";

extension WeatherMapTileExtension on WeatherMapTileEnum {
  String get value {
    switch (this) {
      case WeatherMapTileEnum.clouds:
        return cloudsMapTile;
      case WeatherMapTileEnum.precipitation:
        return precipitationMapTile;
      case WeatherMapTileEnum.pressure:
        return pressureMapTile;
      case WeatherMapTileEnum.wind:
        return windMapTile;
      case WeatherMapTileEnum.temp:
        return tempMapTile;
    }
  }
}

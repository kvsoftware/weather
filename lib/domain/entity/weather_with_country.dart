import 'country_entity.dart';

import 'weather_entity.dart';

class WeatherWithCountryEntity {
  WeatherEntity weather;
  CountryEntity? country;

  WeatherWithCountryEntity({
    required this.weather,
    this.country,
  });
}

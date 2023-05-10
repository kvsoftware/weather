import 'country_entity.dart';
import 'location_entity.dart';
import 'weather_entity.dart';

class LocationWeatherCountryEntity {
  LocationEntity location;
  WeatherEntity weather;
  CountryEntity? country;

  LocationWeatherCountryEntity({required this.location, required this.weather, this.country});
}

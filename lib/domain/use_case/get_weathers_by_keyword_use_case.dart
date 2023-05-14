import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/country_repository.dart';
import '../../data/repository/location_repository.dart';
import '../../data/repository/weather_repository.dart';
import '../entity/country_entity.dart';
import '../entity/location_weather_country_entity.dart';

class GetWeathersByKeywordUseCase {
  final LocationRepository _locationRepository;
  final WeatherRepository _weatherRepository;
  final CountryRepository _countryRepository;

  GetWeathersByKeywordUseCase(this._locationRepository, this._weatherRepository, this._countryRepository);

  Future<List<LocationWeatherCountryEntity>> invoke(
    String q, {
    String? limit,
  }) async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    final locationEntities = await _locationRepository.getLocations(apiKey: apiKey, q: q, limit: 5);
    final locationWeatherCountryEntities = <LocationWeatherCountryEntity>[];

    for (var locationEntity in locationEntities) {
      final weatherEntity = await _weatherRepository.getWeatherByLatLng(
        apiKey: apiKey,
        lat: locationEntity.lat,
        lon: locationEntity.lon,
        units: 'metric',
      );

      CountryEntity? countryEntity;
      try {
        countryEntity = await _countryRepository.getCountryByCode(code: locationEntity.country);
      } catch (e) {
        // Do nothing
      }

      locationWeatherCountryEntities.add(
        LocationWeatherCountryEntity(
          location: locationEntity,
          weather: weatherEntity,
          country: countryEntity,
        ),
      );
    }
    return locationWeatherCountryEntities;
  }
}

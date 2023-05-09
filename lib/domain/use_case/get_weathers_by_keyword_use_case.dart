import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/country_repository.dart';
import '../../data/repository/geo_repository.dart';
import '../../data/repository/weather_repository.dart';
import '../entity/country_entity.dart';
import '../entity/weather_with_country.dart';

class GetWeathersByKeywordUseCase {
  final GeoRepository _geoRepository;
  final WeatherRepository _weatherRepository;
  final CountryRepository _countryRepository;

  GetWeathersByKeywordUseCase(this._geoRepository, this._weatherRepository, this._countryRepository);

  Future<List<WeatherWithCountryEntity>> invoke(
    String q, {
    String? limit,
  }) async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    final locationEntities = await _geoRepository.getLocations(apiKey: apiKey, q: q, limit: 5);
    final weatherWithCountryEntities = <WeatherWithCountryEntity>[];

    for (var locationEntity in locationEntities) {
      final weatherEntity = await _weatherRepository.getWeatherByCoordinate(
        apiKey,
        locationEntity.lat!,
        locationEntity.lon!,
        'metric',
      );

      CountryEntity? countryEntity;
      if (weatherEntity.countryCode != null) {
        try {
          countryEntity = await _countryRepository.getCountryByCode(code: weatherEntity.countryCode!);
        } catch (e) {
          // Do nothing
        }
      }

      weatherWithCountryEntities.add(WeatherWithCountryEntity(weather: weatherEntity, country: countryEntity));
    }
    return weatherWithCountryEntities;
  }
}

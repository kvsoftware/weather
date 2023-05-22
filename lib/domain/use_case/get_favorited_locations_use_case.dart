import 'package:flutter_config/flutter_config.dart';

import '../../data/repository/country_repository.dart';
import '../../data/repository/favorite_repository.dart';
import '../../data/repository/location_repository.dart';
import '../../data/repository/weather_repository.dart';
import '../entity/country_entity.dart';
import '../entity/location_weather_country_entity.dart';

class GetFavoritedLocationsUseCase {
  final FavoriteRepository _favoriteRepository;
  final LocationRepository _locationRepository;
  final WeatherRepository _weatherRepository;
  final CountryRepository _countryRepository;

  GetFavoritedLocationsUseCase(
    this._favoriteRepository,
    this._locationRepository,
    this._weatherRepository,
    this._countryRepository,
  );

  Future<List<LocationWeatherCountryEntity>> invoke() async {
    final favoriteEntites = await _favoriteRepository.getFavorites();
    if (favoriteEntites.isEmpty) return [];

    final apiKey = FlutterConfig.get('OPEN_WEATHER_API_KEY');
    final locationWeatherCountryEntities = <LocationWeatherCountryEntity>[];

    for (var favoriteEntity in favoriteEntites) {
      final locationEntity = await _locationRepository.getLocationById(id: favoriteEntity.locationId);
      if (locationEntity != null) {
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
    }
    return locationWeatherCountryEntities;
  }
}

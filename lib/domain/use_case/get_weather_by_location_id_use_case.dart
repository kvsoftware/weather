import 'package:flutter_config/flutter_config.dart';

import '../../core/constant.dart';
import '../../data/repository/country_repository.dart';
import '../../data/repository/location_repository.dart';
import '../../data/repository/weather_repository.dart';
import '../entity/country_entity.dart';
import '../entity/location_weather_country_entity.dart';

class GetWeatherByIdUseCase {
  final LocationRepository _locationRepository;
  final WeatherRepository _weatherRepository;
  final CountryRepository _countryRepository;
  GetWeatherByIdUseCase(this._locationRepository, this._weatherRepository, this._countryRepository);

  Future<LocationWeatherCountryEntity?> invoke(String locationId) async {
    final locationEntity = await _locationRepository.getLocationById(id: locationId);
    if (locationEntity == null) return null;

    final apiKey = FlutterConfig.get('OPEN_WEATHER_API_KEY');
    final weatherEntity = await _weatherRepository.getWeatherByLatLng(
      apiKey: apiKey,
      lat: locationEntity.lat,
      lon: locationEntity.lon,
      units: metricUnits,
    );

    CountryEntity? countryEntity;
    try {
      countryEntity = await _countryRepository.getCountryByCode(code: locationEntity.country);
    } catch (e) {
      // Do nothing
    }
    return LocationWeatherCountryEntity(location: locationEntity, weather: weatherEntity, country: countryEntity);
  }
}

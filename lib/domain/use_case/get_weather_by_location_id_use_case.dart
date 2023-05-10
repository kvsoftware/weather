import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    final locationDbModel = await _locationRepository.getLocationById(id: locationId);
    if (locationDbModel == null) return null;

    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    final weatherEntity = await _weatherRepository.getWeatherByLatLng(
      apiKey: apiKey,
      lat: locationDbModel.lat,
      lon: locationDbModel.lon,
      units: 'metric',
    );

    CountryEntity? countryEntity;
    try {
      countryEntity = await _countryRepository.getCountryByCode(code: weatherEntity.countryCode);
    } catch (e) {
      // Do nothing
    }
    return LocationWeatherCountryEntity(location: locationDbModel, weather: weatherEntity, country: countryEntity);
  }
}

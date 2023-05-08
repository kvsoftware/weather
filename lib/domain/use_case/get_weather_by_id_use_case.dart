import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/country_repository.dart';
import '../../data/repository/weather_repository.dart';
import '../entity/country_entity.dart';
import '../entity/weather_with_country.dart';

class GetWeatherByIdUseCase {
  final WeatherRepository _weatherRepository;
  final CountryRepository _countryRepository;
  GetWeatherByIdUseCase(this._weatherRepository, this._countryRepository);

  Future<WeatherWithCountryEntity?> invoke(int id) async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    final weatherEntity = await _weatherRepository.getWeatherById(apiKey, id, 'metric');
    if (weatherEntity == null) return null;
    if (weatherEntity.countryCode == null) return WeatherWithCountryEntity(weather: weatherEntity);

    CountryEntity? countryEntity;
    try {
      countryEntity = await _countryRepository.getCountryByCode(code: weatherEntity.countryCode!);
    } catch (e) {
      // Do nothing
    }
    return WeatherWithCountryEntity(weather: weatherEntity, country: countryEntity);
  }
}

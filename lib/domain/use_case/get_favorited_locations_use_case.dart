import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/country_repository.dart';
import '../../data/repository/favorite_repository.dart';
import '../../data/repository/weather_repository.dart';
import '../entity/country_entity.dart';
import '../entity/weather_with_country.dart';

class GetFavoritedLocationsUseCase {
  final FavoriteRepository _favoriteRepository;
  final WeatherRepository _weatherRepository;
  final CountryRepository _countryRepository;

  GetFavoritedLocationsUseCase(this._favoriteRepository, this._weatherRepository, this._countryRepository);

  Future<List<WeatherWithCountryEntity>> invoke() async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    final favoriteEntites = await _favoriteRepository.getFavorites();
    final weatherWithCountryEntities = <WeatherWithCountryEntity>[];
    for (var favoriteEntity in favoriteEntites) {
      final weatherEntity = await _weatherRepository.getWeatherById(apiKey, favoriteEntity.id, 'metric');

      if (weatherEntity != null && weatherEntity.countryCode != null) {
        CountryEntity? countryEntity;
        try {
          countryEntity = await _countryRepository.getCountryByCode(code: weatherEntity.countryCode!);
        } catch (e) {
          // Do nothing
        }
        weatherWithCountryEntities.add(WeatherWithCountryEntity(weather: weatherEntity, country: countryEntity));
      }
    }
    return weatherWithCountryEntities;
  }
}

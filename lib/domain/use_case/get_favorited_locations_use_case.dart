import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/favorite_repository.dart';
import '../../data/repository/weather_repository.dart';
import '../entity/weather_entity.dart';

class GetFavoritedLocationsUseCase {
  final FavoriteRepository _favoriteRepository;
  final WeatherRepository _weatherRepository;

  GetFavoritedLocationsUseCase(this._favoriteRepository, this._weatherRepository);

  Future<List<WeatherEntity>> invoke() async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    final favoriteEntites = await _favoriteRepository.getFavorites();
    final weatherEntities = <WeatherEntity>[];
    for (var favoriteEntity in favoriteEntites) {
      final weatherEntity = await _weatherRepository.getWeatherById(apiKey, favoriteEntity.id, 'metric');
      if (weatherEntity != null) {
        weatherEntities.add(weatherEntity);
      }
    }
    return weatherEntities;
  }
}

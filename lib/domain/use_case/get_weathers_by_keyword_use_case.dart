import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/geo_repository.dart';
import '../../data/repository/weather_repository.dart';
import '../entity/weather_entity.dart';

class GetWeathersByKeywordUseCase {
  final GeoRepository _geoRepository;
  final WeatherRepository _weatherRepository;
  GetWeathersByKeywordUseCase(this._geoRepository, this._weatherRepository);

  Future<List<WeatherEntity>> invoke(
    String q, {
    String? limit,
  }) async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    var locationEntities = await _geoRepository.getLocations(
      apiKey,
      q,
      limit: 5,
    );
    var weatherEntities = <WeatherEntity>[];
    for (var locationEntity in locationEntities) {
      var data = await _weatherRepository.getWeatherByCoordinate(
        apiKey,
        locationEntity.lat!,
        locationEntity.lon!,
        'metric',
      );
      weatherEntities.add(data);
    }
    return weatherEntities;
  }
}

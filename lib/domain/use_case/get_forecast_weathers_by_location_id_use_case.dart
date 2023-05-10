import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/mapper/weather_model_mapper.dart';
import '../../data/repository/location_repository.dart';
import '../../data/repository/weather_repository.dart';
import '../entity/forecast_weather_entity.dart';

class GetForecastWeathersByLocationIdUseCase {
  final LocationRepository _locationRepository;
  final WeatherRepository _weatherRepository;

  GetForecastWeathersByLocationIdUseCase(this._locationRepository, this._weatherRepository);

  Future<List<ForecastWeatherEntity>?> invoke(String locationId) async {
    final locationEntity = await _locationRepository.getLocationById(id: locationId);
    if (locationEntity == null) return null;

    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    var weatherApiModels = await _weatherRepository.getForecastWeathersByLatLng(
      apiKey: apiKey,
      lat: locationEntity.lat,
      lon: locationEntity.lon,
      units: 'metric',
    );

    final forecastWeatherEntities = <ForecastWeatherEntity>[];
    for (var weatherApiModel in weatherApiModels) {
      forecastWeatherEntities.add(weatherApiModel.toForecastWeatherModel());
    }
    return forecastWeatherEntities;
  }
}

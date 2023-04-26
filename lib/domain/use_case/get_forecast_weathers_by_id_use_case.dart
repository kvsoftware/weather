import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/weather_repository.dart';
import '../entity/forecast_weather_entity.dart';
import '../../data/mapper/weather_model_mapper.dart';

class GetForecastWeathersByIdUseCase {
  final WeatherRepository _weatherRepository;
  GetForecastWeathersByIdUseCase(this._weatherRepository);

  Future<List<ForecastWeatherEntity>> invoke(int id) async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    var weatherApiModels = await _weatherRepository.getForecastWeathers(
      apiKey,
      id: id,
      units: 'metric',
    );
    var forecastWeatherEntities = <ForecastWeatherEntity>[];
    for (var weatherApiModel in weatherApiModels) {
      forecastWeatherEntities.add(weatherApiModel.toForecastWeatherModel());
    }
    return forecastWeatherEntities;
  }
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/data_repository.dart';
import '../mapper/weather_model_mapper.dart';
import '../model/forecast_weather_model.dart';

class GetForecastWeathersByIdUseCase {
  final DataRepository _dataRepository;
  GetForecastWeathersByIdUseCase(this._dataRepository);

  Future<List<ForecastWeatherModel>> invoke(int id) async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    var weatherEntities = await _dataRepository.getForecastWeathers(
      apiKey,
      id: id,
      units: 'metric',
    );
    var forecastWeatherModels = <ForecastWeatherModel>[];
    for (var weatherEntity in weatherEntities) {
      forecastWeatherModels.add(weatherEntity.toForecastWeatherModel());
    }
    return forecastWeatherModels;
  }
}

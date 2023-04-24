import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/weather_repository.dart';
import '../mapper/weather_model_mapper.dart';
import '../model/location_weather_model.dart';

class GetWeatherByIdUseCase {
  final WeatherRepository _weatherRepository;
  GetWeatherByIdUseCase(this._weatherRepository);

  Future<LocationWeatherModel> invoke(int id) async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    var weatherModel = await _weatherRepository.getWeather(
      apiKey,
      id: id,
      units: 'metric',
    );
    return weatherModel.toLocationWeatherDetailModel();
  }
}

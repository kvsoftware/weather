import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/weather_repository.dart';
import '../entity/weather_entity.dart';

class GetWeatherByIdUseCase {
  final WeatherRepository _weatherRepository;
  GetWeatherByIdUseCase(this._weatherRepository);

  Future<WeatherEntity?> invoke(int id) async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    var weatherModel = await _weatherRepository.getWeatherById(apiKey, id, 'metric');
    return weatherModel;
  }
}

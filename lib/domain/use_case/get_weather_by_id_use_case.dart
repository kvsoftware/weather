import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/data_repository.dart';
import '../mapper/weather_model_mapper.dart';
import '../model/weather_detail_model.dart';

class GetWeatherByIdUseCase {
  final DataRepository _dataRepository;
  GetWeatherByIdUseCase(this._dataRepository);

  Future<WeatherDetailModel> invoke(int id) async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    var weatherEntity = await _dataRepository.getWeatherData(
      apiKey,
      id: id,
      units: 'metric',
    );
    return weatherEntity.toWeatherDetailModel();
  }
}

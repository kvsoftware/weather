import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/geo_repository.dart';
import '../../data/repository/weather_repository.dart';
import '../mapper/location_model_mapper.dart';
import '../model/location_weather_model.dart';

class GetWeathersByKeywordUseCase {
  final GeoRepository _geoRepository;
  final WeatherRepository _weatherRepository;
  GetWeathersByKeywordUseCase(this._geoRepository, this._weatherRepository);

  Future<List<LocationWeatherModel>> invoke(
    String q, {
    String? limit,
  }) async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    var locationModels = await _geoRepository.getLocations(
      apiKey,
      q,
      limit: 5,
    );
    var weatherModels = <LocationWeatherModel>[];
    for (var locationModel in locationModels) {
      var data = await _weatherRepository.getWeather(
        apiKey,
        lat: locationModel.lat!,
        lon: locationModel.lon!,
        units: 'metric',
      );
      weatherModels.add(
        locationModel.toLocationWeatherDetailModel(
          id: data.id,
          cityName: data.name,
          temp: data.main?.temp,
          dt: data.dt,
          weathers: data.weather,
        ),
      );
    }
    return weatherModels;
  }
}

import 'model/weather_api_model.dart';
import 'rest/data_service.dart';

class WeatherRemoteDataSource {
  final DataService _dataService;

  WeatherRemoteDataSource(this._dataService);

  Future<WeatherApiModel> getWeatherByLatLng({
    required String apiKey,
    required double lat,
    required double lon,
    String? units,
  }) {
    return _dataService.getWeatherByLatLng(
      apiKey: apiKey,
      lat: lat,
      lon: lon,
      units: units,
    );
  }

  Future<List<WeatherApiModel>> getForecastWeathersByLatLng({
    required String apiKey,
    required double lat,
    required double lon,
    String? units,
    String? lang,
  }) async {
    var response = await _dataService.getForecastWeathersByLatLng(
      apiKey: apiKey,
      lat: lat,
      lon: lon,
      units: units,
      lang: lang,
    );
    return response.list ?? [];
  }
}

import 'model/weather_api_model.dart';
import 'rest/data_service.dart';

class WeatherRemoteDataSource {
  final DataService _dataService;

  WeatherRemoteDataSource(this._dataService);

  Future<WeatherApiModel> getWeather(
    String appid, {
    int? id,
    double? lat,
    double? lon,
    String? units,
    String? lang,
  }) {
    return _dataService.getWeather(
      appid,
      id: id,
      lat: lat,
      lon: lon,
      units: units,
      lang: lang,
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

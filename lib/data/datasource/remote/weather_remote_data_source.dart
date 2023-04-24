import 'model/weather_model.dart';
import 'rest/data_service.dart';

class WeatherRemoteDataSource {
  final DataService _dataService;

  WeatherRemoteDataSource(this._dataService);

  Future<WeatherModel> getWeatherData(
    String appid, {
    int? id,
    double? lat,
    double? lon,
    String? units,
    String? lang,
  }) {
    return _dataService.getWeatherData(
      appid,
      id: id,
      lat: lat,
      lon: lon,
      units: units,
      lang: lang,
    );
  }

  Future<List<WeatherModel>> getForecastWeathers(
    String appid, {
    int? id,
    double? lat,
    double? lon,
    String? units,
    String? lang,
  }) async {
    var response = await _dataService.getForecastWeathers(
      appid,
      id: id,
      lat: lat,
      lon: lon,
      units: units,
      lang: lang,
    );
    return response.list ?? [];
  }
}

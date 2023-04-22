import '../entity/weather_entity.dart';
import '../remote/data_service.dart';

class DataDataSource {
  final DataService _dataService;

  DataDataSource(this._dataService);

  Future<WeatherEntity> getWeatherData(
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
}

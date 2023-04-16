import '../datasource/data_data_source.dart';
import '../entity/weather_entity.dart';

class DataRepository {
  final DataDataSource _dataDataSource;
  DataRepository(this._dataDataSource);

  Future<WeatherEntity> getWeatherData(
      String appid, double lat, double lon,
      {String? units, String? lang}) {
    try {
      return _dataDataSource.getWeatherData(appid, lat, lon,
          units: units, lang: lang);
    } catch (e) {
      throw Exception('Connection failed');
    }
  }
}

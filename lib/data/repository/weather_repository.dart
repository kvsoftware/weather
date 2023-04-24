import '../datasource/local/weather_local_data_source.dart';
import '../datasource/remote/model/weather_model.dart';
import '../datasource/remote/weather_remote_data_source.dart';

class WeatherRepository {
  final WeatherLocalDataSource _weatherLocalDataSource;
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  WeatherRepository(
    this._weatherLocalDataSource,
    this._weatherRemoteDataSource,
  );

  Future<List<WeatherModel>> getFavoriteWeathers() async {
    final response = await _weatherLocalDataSource.getWeathers();
    return response.map((e) => WeatherModel(id: e.id, name: e.name)).toList();
  }

  Future<WeatherModel> getWeather(
    String appid, {
    int? id,
    double? lat,
    double? lon,
    String? units,
    String? lang,
  }) {
    try {
      return _weatherRemoteDataSource.getWeatherData(
        appid,
        id: id,
        lat: lat,
        lon: lon,
        units: units,
        lang: lang,
      );
    } catch (e) {
      throw Exception('Connection failed');
    }
  }

  Future<List<WeatherModel>> getForecastWeathers(
    String appid, {
    int? id,
    double? lat,
    double? lon,
    String? units,
    String? lang,
  }) {
    try {
      return _weatherRemoteDataSource.getForecastWeathers(
        appid,
        id: id,
        lat: lat,
        lon: lon,
        units: units,
        lang: lang,
      );
    } catch (e) {
      throw Exception('Connection failed');
    }
  }
}

import '../../domain/entity/weather_entity.dart';
import '../datasource/local/weather_local_data_source.dart';
import '../datasource/remote/model/weather_api_model.dart';
import '../datasource/remote/weather_remote_data_source.dart';
import '../mapper/weather_model_mapper.dart';

class WeatherRepository {
  final WeatherLocalDataSource _weatherLocalDataSource;
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  WeatherRepository(
    this._weatherLocalDataSource,
    this._weatherRemoteDataSource,
  );

  Future<List<WeatherEntity>> getFavoriteWeathers() async {
    final response = await _weatherLocalDataSource.getWeathers();
    return response.map((e) => WeatherEntity(id: e.id, name: e.name)).toList();
  }

  Future<WeatherEntity> getWeatherByCoordinate(
    String appid,
    double? lat,
    double? lon,
    String? units,
  ) async {
    try {
      final weatherModel = await _weatherRemoteDataSource.getWeather(
        appid,
        lat: lat,
        lon: lon,
        units: units,
      );
      return weatherModel.toWeatherEntity();
    } catch (e) {
      throw Exception('Connection failed');
    }
  }

  Future<WeatherEntity?> getWeatherById(
    String appid,
    int id,
    String? units,
  ) async {
    try {
      final weatherModel = await _weatherRemoteDataSource.getWeather(
        appid,
        id: id,
        units: units,
      );
      _weatherLocalDataSource.insertWeather(weatherModel.toWeatherDbModel());
    } catch (e) {
      // print
    }
    final weatherDbModel = await _weatherLocalDataSource.getWeatherById(id);
    return weatherDbModel?.toWeatherEntity();
  }

  Future<List<WeatherApiModel>> getForecastWeathers(
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

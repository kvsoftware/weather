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

  Future<WeatherEntity> getWeatherByLatLng({
    required String apiKey,
    required double lat,
    required double lon,
    String? units,
  }) async {
    try {
      final weatherApiModel = await _weatherRemoteDataSource.getWeather(
        apiKey,
        lat: lat,
        lon: lon,
        units: units,
      );
      final id = "${lat}_$lon";
      _weatherLocalDataSource.insertWeather(weatherApiModel.toWeatherDbModel(id));
      return (await _weatherLocalDataSource.getWeatherById(id))!.toWeatherEntity();
    } catch (e) {
      throw Exception('Connection failed');
    }
  }

  // Future<WeatherEntity?> getWeatherById(
  //   String appid,
  //   String id,
  //   String? units,
  // ) async {
  //   try {
  //     final weatherModel = await _weatherRemoteDataSource.getWeather(
  //       appid,
  //       id: id,
  //       units: units,
  //     );
  //     _weatherLocalDataSource.insertWeather(weatherModel.toWeatherDbModel());
  //   } catch (e) {
  //     // Do nothing
  //   }
  //   final weatherDbModel = await _weatherLocalDataSource.getWeatherById(id);
  //   return weatherDbModel?.toWeatherEntity();
  // }

  Future<List<WeatherApiModel>> getForecastWeathersByLatLng({
    required String apiKey,
    required double lat,
    required double lon,
    String? units,
    String? lang,
  }) {
    try {
      return _weatherRemoteDataSource.getForecastWeathersByLatLng(
        apiKey: apiKey,
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

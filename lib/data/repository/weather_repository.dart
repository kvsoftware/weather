import '../../domain/entity/weather_entity.dart';
import '../datasource/local/weather_local_data_source.dart';
import '../datasource/remote/weather_remote_data_source.dart';
import '../mapper/weather_model_mapper.dart';

class WeatherRepository {
  final WeatherLocalDataSource _weatherLocalDataSource;
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  WeatherRepository(this._weatherLocalDataSource, this._weatherRemoteDataSource);

  Future<WeatherEntity> getWeatherByLatLng({
    required String apiKey,
    required double lat,
    required double lon,
    String? units,
  }) async {
    final id = "${lat}_$lon";
    try {
      final weatherApiModel = await _weatherRemoteDataSource.getWeatherByLatLng(
        apiKey: apiKey,
        lat: lat,
        lon: lon,
        units: units,
      );
      final weatherDbModel = weatherApiModel.toWeatherDbModel(id);
      _weatherLocalDataSource.insertWeather(weatherDbModel);
    } catch (e) {
      // Do nothing
    }

    final weatherDbModel = await _weatherLocalDataSource.getWeatherById(id);
    if (weatherDbModel == null) {
      throw Exception('No data');
    }
    return weatherDbModel.toWeatherEntity();
  }
}

import 'package:floor/floor.dart';

import '../entity/weather_entity.dart';

@dao
abstract class WeatherDao {
  @Query('SELECT * FROM weather')
  Future<List<WeatherEntity>> getWeathers();

  @Query('SELECT * FROM weather WHERE id = :id')
  Future<WeatherEntity?> getWeatherById(int id);

  @insert
  Future<void> insertWeather(WeatherEntity weather);

  @Query('DELETE FROM weather WHERE id = :id')
  Future<void> deleteWeatherById(int id);
}

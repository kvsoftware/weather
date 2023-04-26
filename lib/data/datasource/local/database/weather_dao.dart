import 'package:floor/floor.dart';

import '../model/weather_db_model.dart';

@dao
abstract class WeatherDao {
  @Query('SELECT * FROM weather')
  Future<List<WeatherDbModel>> getWeathers();

  @Query('SELECT * FROM weather WHERE id = :id')
  Future<WeatherDbModel?> getWeatherById(int id);

  @insert
  Future<void> insertWeather(WeatherDbModel weatherDbModel);

  @Query('DELETE FROM weather WHERE id = :id')
  Future<void> deleteWeatherById(int id);
}

import 'package:floor/floor.dart';

import '../model/weather_db_model.dart';

@dao
abstract class WeatherDao {
  @Query('SELECT * FROM weather')
  Future<List<WeatherDbModel>> getWeathers();

  @Query('SELECT * FROM weather WHERE id = :id')
  Future<WeatherDbModel?> getWeatherById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertWeather(WeatherDbModel weatherDbModel);

  @delete
  Future<void> deleteWeather(WeatherDbModel weatherDbModel);
}

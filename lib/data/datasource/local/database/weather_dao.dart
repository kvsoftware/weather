import 'package:floor/floor.dart';

import '../model/weather_db_model.dart';
import 'database_module.dart';

const String columnId = 'id';

@dao
abstract class WeatherDao {
  @Query('SELECT * FROM $weatherTable')
  Future<List<WeatherDbModel>> getWeathers();

  @Query('SELECT * FROM $weatherTable WHERE $columnId = :id')
  Future<WeatherDbModel?> getWeatherById(String id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertWeather(WeatherDbModel weatherDbModel);

  @delete
  Future<void> deleteWeather(WeatherDbModel weatherDbModel);
}

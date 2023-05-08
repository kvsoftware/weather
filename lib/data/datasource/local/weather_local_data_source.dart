import 'database/database_module.dart';
import 'model/weather_db_model.dart';

class WeatherLocalDataSource {
  final DatabaseModule _databaseModule;

  WeatherLocalDataSource(this._databaseModule);

  Future<List<WeatherDbModel>> getWeathers() {
    return _databaseModule.weatherDao.getWeathers();
  }

  Future<WeatherDbModel?> getWeatherById(int id) {
    return _databaseModule.weatherDao.getWeatherById(id);
  }

  Future<void> insertWeather(WeatherDbModel weatherDbModel) {
    return _databaseModule.weatherDao.insertWeather(weatherDbModel);
  }

  Future<void> deleteWeather(WeatherDbModel weatherDbModel) {
    return _databaseModule.weatherDao.deleteWeather(weatherDbModel);
  }
}

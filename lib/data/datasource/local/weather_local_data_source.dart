import 'database/app_database.dart';
import 'model/weather_db_model.dart';

class WeatherLocalDataSource {
  final AppDatabase _appDatabase;

  WeatherLocalDataSource(this._appDatabase);

  Future<List<WeatherDbModel>> getWeathers() {
    return _appDatabase.weatherDao.getWeathers();
  }

  Future<WeatherDbModel?> getWeatherById(int id) {
    return _appDatabase.weatherDao.getWeatherById(id);
  }

  Future<void> insertWeather(WeatherDbModel weatherDbModel) {
    return _appDatabase.weatherDao.insertWeather(weatherDbModel);
  }

  Future<void> deleteWeather(WeatherDbModel weatherDbModel) {
    return _appDatabase.weatherDao.deleteWeather(weatherDbModel);
  }
}

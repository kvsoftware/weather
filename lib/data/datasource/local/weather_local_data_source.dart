import 'database/app_database.dart';
import 'entity/weather_entity.dart';

class WeatherLocalDataSource {
  final AppDatabase _appDatabase;

  WeatherLocalDataSource(this._appDatabase);

  Future<void> addWeather(WeatherEntity weatherEntity) {
    return _appDatabase.weatherDao.insertWeather(weatherEntity);
  }

  Future<List<WeatherEntity>> getWeathers() {
    return _appDatabase.weatherDao.getWeathers();
  }

  Future<WeatherEntity?> getWeatherById(int id) {
    return _appDatabase.weatherDao.getWeatherById(id);
  }
}

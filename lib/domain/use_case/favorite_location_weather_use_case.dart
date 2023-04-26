import '../../data/datasource/local/database/app_database.dart';
import '../../data/datasource/local/model/weather_db_model.dart';

class FavoriteLocationWeatherUseCase {
  final AppDatabase _appDatabase;

  FavoriteLocationWeatherUseCase(this._appDatabase);

  Future<void> invoke(int weatherId, bool isFavorited) async {
    if (isFavorited) {
      return _appDatabase.weatherDao
          .insertWeather(WeatherDbModel(weatherId, 'test'));
    } else {
      return _appDatabase.weatherDao.deleteWeatherById(weatherId);
    }
  }
}

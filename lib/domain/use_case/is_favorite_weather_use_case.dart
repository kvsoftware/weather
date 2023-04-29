import '../../data/datasource/local/database/app_database.dart';

class IsFavoriteWeatherUseCase {
  final AppDatabase _appDatabase;

  IsFavoriteWeatherUseCase(this._appDatabase);

  Future<bool> invoke(int weatherId) async {
    return await _appDatabase.favoriteDao.getFavoriteById(weatherId) != null;
  }
}

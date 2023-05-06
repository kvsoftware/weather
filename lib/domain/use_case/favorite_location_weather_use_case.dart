import '../../data/datasource/local/database/app_database.dart';
import '../../data/datasource/local/model/favorite_db_model.dart';

class FavoriteLocationWeatherUseCase {
  final AppDatabase _appDatabase;

  FavoriteLocationWeatherUseCase(this._appDatabase);

  Future<void> invoke(int weatherId, bool isFavorited) async {
    if (isFavorited) {
      return _appDatabase.favoriteDao
          .insertFavorite(FavoriteDbModel(id: weatherId));
    } else {
      return _appDatabase.favoriteDao
          .deleteFavorite(FavoriteDbModel(id: weatherId));
    }
  }
}

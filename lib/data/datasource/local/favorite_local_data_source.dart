import 'database/app_database.dart';
import 'model/favorite_db_model.dart';

class FavoriteLocalDataSource {
  final AppDatabase _appDatabase;

  FavoriteLocalDataSource(this._appDatabase);

  Future<List<FavoriteDbModel>> getFavorites() {
    return _appDatabase.favoriteDao.getFavorites();
  }

  Future<FavoriteDbModel?> getFavoriteById(int id) {
    return _appDatabase.favoriteDao.getFavoriteById(id);
  }

  Future<void> insertFavorite(FavoriteDbModel favoriteDbModel) {
    return _appDatabase.favoriteDao.insertFavorite(favoriteDbModel);
  }

  Future<void> deleteFavorite(FavoriteDbModel favoriteDbModel) {
    return _appDatabase.favoriteDao.deleteFavorite(favoriteDbModel);
  }
}

import 'database/database_module.dart';
import 'model/favorite_db_model.dart';

class FavoriteLocalDataSource {
  final DatabaseModule _databaseModule;

  FavoriteLocalDataSource(this._databaseModule);

  Future<List<FavoriteDbModel>> getFavorites() {
    return _databaseModule.favoriteDao.getFavorites();
  }

  Future<FavoriteDbModel?> getFavoriteByLocationId(String id) {
    return _databaseModule.favoriteDao.getFavoriteByLocationId(id);
  }

  Future<void> insertFavorite(FavoriteDbModel favoriteDbModel) {
    return _databaseModule.favoriteDao.insertFavorite(favoriteDbModel);
  }

  Future<void> deleteFavorite(FavoriteDbModel favoriteDbModel) {
    return _databaseModule.favoriteDao.deleteFavorite(favoriteDbModel);
  }
}

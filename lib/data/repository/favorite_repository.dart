import '../datasource/local/model/favorite_db_model.dart';

import '../../domain/entity/favorite_entity.dart';
import '../datasource/local/favorite_local_data_source.dart';

class FavoriteRepository {
  final FavoriteLocalDataSource _favoriteLocalDataSource;
  FavoriteRepository(this._favoriteLocalDataSource);

  Future<FavoriteEntity?> getFavoriteById(int id) async {
    final favoriteModel = await _favoriteLocalDataSource.getFavoriteById(id);
    if (favoriteModel == null) return Future.value(null);
    return FavoriteEntity(id: favoriteModel.id);
  }

  Future<List<FavoriteEntity>> getFavorites() async {
    final favoriteModels = await _favoriteLocalDataSource.getFavorites();
    return favoriteModels.map((e) => FavoriteEntity(id: e.id)).toList();
  }

  Future<void> setFavorite(int id) async {
    final favoriteModel = FavoriteDbModel(id: id);
    await _favoriteLocalDataSource.insertFavorite(favoriteModel);
  }

  Future<void> deleteFavorite(int id) async {
    final favoriteModel = FavoriteDbModel(id: id);
    await _favoriteLocalDataSource.deleteFavorite(favoriteModel);
  }
}

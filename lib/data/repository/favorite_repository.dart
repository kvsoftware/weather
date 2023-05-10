import '../../domain/entity/favorite_entity.dart';
import '../datasource/local/favorite_local_data_source.dart';
import '../datasource/local/model/favorite_db_model.dart';

class FavoriteRepository {
  final FavoriteLocalDataSource _favoriteLocalDataSource;
  FavoriteRepository(this._favoriteLocalDataSource);

  Future<FavoriteEntity?> getFavoriteByLocationId(String locationId) async {
    final favoriteModel = await _favoriteLocalDataSource.getFavoriteByLocationId(locationId);
    if (favoriteModel == null) return Future.value(null);
    return FavoriteEntity(locationId: favoriteModel.locationId);
  }

  Future<List<FavoriteEntity>> getFavorites() async {
    final favoriteModels = await _favoriteLocalDataSource.getFavorites();
    return favoriteModels.map((e) => FavoriteEntity(locationId: e.locationId)).toList();
  }

  Future<void> setFavorite(String locationId) async {
    final favoriteModel = FavoriteDbModel(locationId: locationId);
    await _favoriteLocalDataSource.insertFavorite(favoriteModel);
  }

  Future<void> deleteFavorite(String locationId) async {
    final favoriteModel = FavoriteDbModel(locationId: locationId);
    await _favoriteLocalDataSource.deleteFavorite(favoriteModel);
  }
}

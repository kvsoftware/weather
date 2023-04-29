import '../../domain/entity/favorite_entity.dart';
import '../datasource/local/favorite_local_data_source.dart';

class FavoriteRepository {
  final FavoriteLocalDataSource _favoriteLocalDataSource;
  FavoriteRepository(this._favoriteLocalDataSource);

  Future<List<FavoriteEntity>> getFavorites() async {
    try {
      final favoriteModels = await _favoriteLocalDataSource.getFavorites();
      return favoriteModels.map((e) => FavoriteEntity(id: e.id)).toList();
    } catch (e) {
      throw Exception('Connection failed');
    }
  }
}

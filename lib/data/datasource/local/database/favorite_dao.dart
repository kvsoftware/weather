import 'package:floor/floor.dart';

import '../model/favorite_db_model.dart';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM favorite')
  Future<List<FavoriteDbModel>> getFavorites();

  @Query('SELECT * FROM favorite WHERE id = :id')
  Future<FavoriteDbModel?> getFavoriteById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertFavorite(FavoriteDbModel favoriteDbModel);

  @delete
  Future<void> deleteFavorite(FavoriteDbModel favoriteDbModel);
}

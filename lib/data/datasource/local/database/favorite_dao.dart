import 'package:floor/floor.dart';

import '../model/favorite_db_model.dart';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM favorite')
  Future<List<FavoriteDbModel>> getFavorites();

  @Query('SELECT * FROM favorite WHERE locationId = :locationId')
  Future<FavoriteDbModel?> getFavoriteByLocationId(String locationId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertFavorite(FavoriteDbModel favoriteDbModel);

  @delete
  Future<void> deleteFavorite(FavoriteDbModel favoriteDbModel);
}

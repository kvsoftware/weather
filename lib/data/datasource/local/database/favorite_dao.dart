import 'package:floor/floor.dart';

import '../model/favorite_db_model.dart';
import 'database_module.dart';

const String columnLocationId = 'locationId';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM $favoriteTable')
  Future<List<FavoriteDbModel>> getFavorites();

  @Query('SELECT * FROM $favoriteTable WHERE $columnLocationId = :locationId')
  Future<FavoriteDbModel?> getFavoriteByLocationId(String locationId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertFavorite(FavoriteDbModel favoriteDbModel);

  @delete
  Future<void> deleteFavorite(FavoriteDbModel favoriteDbModel);
}

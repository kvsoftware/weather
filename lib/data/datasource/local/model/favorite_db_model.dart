import 'package:floor/floor.dart';

import '../database/database_module.dart';

@Entity(tableName: favoriteTable)
class FavoriteDbModel {
  @primaryKey
  final String locationId;

  FavoriteDbModel({required this.locationId});
}

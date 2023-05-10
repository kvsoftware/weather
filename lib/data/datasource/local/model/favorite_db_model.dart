import 'package:floor/floor.dart';

@Entity(tableName: 'favorite')
class FavoriteDbModel {
  @primaryKey
  final String locationId;

  FavoriteDbModel({required this.locationId});
}

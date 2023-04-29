import 'package:floor/floor.dart';

@Entity(tableName: 'favorite')
class FavoriteDbModel {
  @primaryKey
  final int id;

  FavoriteDbModel({required this.id});
}

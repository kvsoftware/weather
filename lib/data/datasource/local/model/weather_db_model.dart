import 'package:floor/floor.dart';

@Entity(tableName: 'weather')
class WeatherDbModel {
  @primaryKey
  final int id;
  final String name;

  WeatherDbModel(this.id, this.name);
}

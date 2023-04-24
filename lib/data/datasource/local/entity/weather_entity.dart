// entity/person.dart

import 'package:floor/floor.dart';

@Entity(tableName: 'weather')
class WeatherEntity {
  @primaryKey
  final int id;
  final String name;

  WeatherEntity(this.id, this.name);
}

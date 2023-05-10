import 'package:floor/floor.dart';

@Entity(tableName: 'location')
class LocationDbModel {
  @primaryKey
  final String id;
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String state;

  LocationDbModel({
    required this.id,
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });
}

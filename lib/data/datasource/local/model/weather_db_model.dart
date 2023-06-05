import 'package:floor/floor.dart';

import '../database/database_module.dart';

@Entity(tableName: weatherTable)
class WeatherDbModel {
  @primaryKey
  final String id;
  final double lat;
  final double lon;
  final double temp;
  final int weatherCode;
  final String weatherIcon;
  final String weatherCondition;
  final int dt;
  final String hourly;
  final String daily;

  WeatherDbModel({
    required this.id,
    required this.lat,
    required this.lon,
    required this.temp,
    required this.weatherCode,
    required this.weatherIcon,
    required this.weatherCondition,
    required this.dt,
    required this.hourly,
    required this.daily,
  });
}

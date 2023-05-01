import 'package:floor/floor.dart';

@Entity(tableName: 'weather')
class WeatherDbModel {
  @primaryKey
  final int id;
  final String name;
  final double lat;
  final double lon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final int weatherCode;
  final String weatherIcon;
  final String weatherCondition;
  final int dt;

  WeatherDbModel({
    required this.id,
    required this.name,
    required this.lat,
    required this.lon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weatherCode,
    required this.weatherIcon,
    required this.weatherCondition,
    required this.dt,
  });
}

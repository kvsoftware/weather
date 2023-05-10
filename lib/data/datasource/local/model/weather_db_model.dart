import 'package:floor/floor.dart';

@Entity(tableName: 'weather')
class WeatherDbModel {
  @primaryKey
  final String id;
  final String countryCode;
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
    required this.countryCode,
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

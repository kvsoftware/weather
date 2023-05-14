import 'daily_entity.dart';
import 'hourly_entity.dart';

class WeatherEntity {
  double lat;
  double lon;
  double temp;
  int weatherCode;
  String weatherIcon;
  String weatherCondition;
  List<HourlyEntity> hourly;
  List<DailyEntity> daily;
  DateTime dt;

  WeatherEntity({
    required this.lat,
    required this.lon,
    required this.temp,
    required this.weatherCode,
    required this.weatherIcon,
    required this.weatherCondition,
    required this.hourly,
    required this.daily,
    required this.dt,
  });
}

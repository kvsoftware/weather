import '../../domain/entity/hourly_entity.dart';
import '../datasource/remote/model/weather_api_model.dart';

extension HourlyApiModelMapping on HourlyApiModel {
  HourlyEntity toHourlyEntity() {
    return HourlyEntity(
      temp: temp?.round() ?? 0,
      weatherCode: _getWeatherCode(),
      weatherIcon: _getWeatherIcon(),
      dt: _getDateTime(),
    );
  }

  String toHourlyString() {
    return '';
  }

  int _getWeatherCode() {
    if (weather == null) return 0;
    if (weather!.isEmpty) return 0;
    return weather![0].id ?? 0;
  }

  String _getWeatherIcon() {
    if (weather == null) return '';
    if (weather!.isEmpty) return '';
    return weather![0].icon ?? '';
  }

  DateTime _getDateTime() {
    if (dt == null) DateTime.now();
    return DateTime.fromMillisecondsSinceEpoch(dt! * 1000);
  }
}

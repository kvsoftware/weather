import '../../domain/entity/daily_entity.dart';
import '../datasource/remote/model/weather_api_model.dart';

extension DailyApiModelMapping on DailyApiModel {
  DailyEntity toDailyEntity() {
    return DailyEntity(
      tempMin: temp?.min?.round() ?? 0,
      tempMax: temp?.max?.round() ?? 0,
      weatherCode: _getWeatherCode(),
      weatherIcon: _getWeatherIcon(),
      weatherCondition: _getWeatherCondition(),
      dt: _getDateTime(),
    );
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

  String _getWeatherCondition() {
    if (weather == null) return '';
    if (weather!.isEmpty) return '';
    return weather![0].description ?? '';
  }

  DateTime _getDateTime() {
    if (dt == null) DateTime.now();
    return DateTime.fromMillisecondsSinceEpoch(dt! * 1000);
  }
}

import 'package:intl/intl.dart';

import '../../data/entity/location_entity.dart';
import '../../data/entity/weather_condition_entity.dart';
import '../model/weather_model.dart';

extension LocationModelParsing on LocationEntity {
  WeatherModel toWeatherModel({
    int? id,
    String? cityName,
    double? temp,
    int? dt,
    List<WeatherConditionEntity>? weathers,
  }) {
    return WeatherModel(
        id: id,
        name: name,
        cityName: cityName,
        lat: lat,
        lon: lon,
        country: country,
        state: state,
        temp: temp,
        dateTime: _getDateTimeStr(dt),
        weatherIconPath: _getWeatherIconPath(weathers));
  }

  _getDateTimeStr(int? dt) {
    if (dt == null) return null;
    var dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    return DateFormat('yyyy-MM-dd kk:mm').format(dateTime);
  }

  _getWeatherIconPath(List<WeatherConditionEntity>? weather) {
    if (weather == null) return null;
    if (weather.isEmpty) return null;
    return 'https://openweathermap.org/img/wn/${weather[0].icon}@2x.png';
  }
}

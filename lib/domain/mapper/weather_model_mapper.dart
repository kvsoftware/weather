import 'package:intl/intl.dart';

import '../../data/entity/weather_entity.dart';
import '../model/weather_detail_model.dart';

extension WeatherModelParsing on WeatherEntity {
  WeatherDetailModel toWeatherDetailModel() {
    return WeatherDetailModel(
      id: id,
      name: name,
      dateTime: _getDateTimeStr(dt),
      temp: _getTemp(),
      tempMin: _getTempMin(),
      tempMax: _getTempMax(),
      weatherIconPath: _getWeatherIconPath(),
      weatherCondition: _getWeatherCondition(),
    );
  }

  _getDateTimeStr(int? dt) {
    if (dt == null) return null;
    var dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    return DateFormat('yyyy-MM-dd kk:mm').format(dateTime);
  }

  _getTemp() {
    if (main == null) return null;
    return main!.temp!.round();
  }

  _getTempMin() {
    if (main?.tempMin == null) return null;
    return main!.tempMin!.round();
  }

  _getTempMax() {
    if (main?.tempMax == null) return null;
    return main!.tempMax!.round();
  }

  _getWeatherIconPath() {
    if (weather == null) return null;
    if (weather!.isEmpty) return null;
    return 'https://openweathermap.org/img/wn/${weather![0].icon}@4x.png';
  }

  _getWeatherCondition() {
    if (weather == null) return null;
    if (weather!.isEmpty) return null;
    return weather![0].description ?? '';
  }
}

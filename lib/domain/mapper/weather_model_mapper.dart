import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/entity/weather_entity.dart';
import '../model/forecast_weather_model.dart';
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

  ForecastWeatherModel toForecastWeatherModel() {
    return ForecastWeatherModel(
      temp: _getTemp(),
      tempMin: _getTempMin(),
      tempMax: _getTempMax(),
      dateTime: _getDateTimeStr(dt),
      weatherIconPath: _getWeatherIconPath(),
      weatherCondition: _getWeatherCondition(),
    );
  }

  _getDateTimeStr(int? dt) {
    if (dt == null) return null;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    final now = DateTime.now();

    if (DateUtils.isSameDay(dateTime, now)) {
      return 'Today ${DateFormat('kk:mm').format(dateTime)}';
    }
    return DateFormat('EEE d MMMM, kk:mm').format(dateTime);
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
    return weather![0].main ?? '';
  }
}

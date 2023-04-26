import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../datasource/remote/model/weather_api_model.dart';
import '../../domain/entity/forecast_weather_entity.dart';
import '../../domain/entity/weather_entity.dart';

extension WeatherModelMapping on WeatherApiModel {
  WeatherEntity toWeatherEntity() {
    return WeatherEntity(
      id: id,
      name: name,
      lat: coord?.lat,
      lon: coord?.lon,
      temp: main?.temp,
      tempMin: main?.tempMin,
      tempMax: main?.tempMax,
      weatherIcon: weather?[0].icon,
      weatherCondition: weather?[0].main,
      dt: _getDateTime(),
    );
  }

  ForecastWeatherEntity toForecastWeatherModel() {
    return ForecastWeatherEntity(
      temp: _getTemp(),
      tempMin: _getTempMin(),
      tempMax: _getTempMax(),
      dateTime: _getDateTimeStr2(dt),
      weatherIconPath: _getWeatherIconPath(),
      weatherCondition: _getWeatherCondition(),
    );
  }

  _getDateTime() {
    if (dt == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(dt! * 1000);
  }

  _getDateTimeStr1(int? dt) {
    if (dt == null) return null;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    return DateFormat('EEE d MMMM, kk:mm').format(dateTime);
  }

  _getDateTimeStr2(int? dt) {
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

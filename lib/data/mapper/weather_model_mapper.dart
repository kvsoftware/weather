import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entity/forecast_weather_entity.dart';
import '../../domain/entity/weather_entity.dart';
import '../datasource/local/model/weather_db_model.dart';
import '../datasource/remote/model/weather_api_model.dart';

extension WeatherDbModelMapping on WeatherDbModel {
  WeatherEntity toWeatherEntity() {
    return WeatherEntity(
      lat: lat,
      lon: lon,
      temp: temp,
      tempMin: tempMin,
      tempMax: tempMax,
      weatherCode: weatherCode,
      weatherIcon: weatherIcon,
      weatherCondition: weatherCondition,
      dt: DateTime.fromMillisecondsSinceEpoch(dt * 1000),
      countryCode: countryCode,
    );
  }
}

extension WeatherApiModelMapping on WeatherApiModel {
  WeatherEntity toWeatherEntity() {
    return WeatherEntity(
      lat: coord?.lat ?? 0,
      lon: coord?.lon ?? 0,
      temp: main?.temp ?? 0,
      tempMin: main?.tempMin ?? 0,
      tempMax: main?.tempMax ?? 0,
      weatherCode: _getWeatherCode(),
      weatherIcon: _getWeatherIconPath(),
      weatherCondition: _getWeatherCondition(),
      dt: _getDateTime(),
      countryCode: _getCountryCode(),
    );
  }

  WeatherDbModel toWeatherDbModel(String id) {
    return WeatherDbModel(
      id: id,
      lat: coord?.lat ?? 0,
      lon: coord?.lon ?? 0,
      temp: main?.temp ?? 0,
      tempMin: main?.tempMin ?? 0,
      tempMax: main?.tempMax ?? 0,
      weatherCode: _getWeatherCode(),
      weatherIcon: _getWeatherIconPath(),
      weatherCondition: _getWeatherCondition(),
      dt: dt ?? 0,
      countryCode: _getCountryCode(),
    );
  }

  ForecastWeatherEntity toForecastWeatherModel() {
    return ForecastWeatherEntity(
      temp: _getTemp(),
      tempMin: _getTempMin(),
      tempMax: _getTempMax(),
      dateTime: _getDateTimeStr(dt),
      weatherIconPath: _getWeatherIconPath(),
      weatherCondition: _getWeatherCondition(),
    );
  }

  DateTime _getDateTime() {
    if (dt == null) DateTime.now();
    return DateTime.fromMillisecondsSinceEpoch(dt! * 1000);
  }

  String? _getDateTimeStr(int? dt) {
    if (dt == null) return null;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    final now = DateTime.now();

    if (DateUtils.isSameDay(dateTime, now)) {
      return 'Today ${DateFormat('kk:mm').format(dateTime)}';
    }
    return DateFormat('EEE d MMMM, kk:mm').format(dateTime);
  }

  int? _getTemp() {
    if (main == null) return null;
    return main!.temp!.round();
  }

  int? _getTempMin() {
    if (main?.tempMin == null) return null;
    return main!.tempMin!.round();
  }

  int? _getTempMax() {
    if (main?.tempMax == null) return null;
    return main!.tempMax!.round();
  }

  int _getWeatherCode() {
    if (weather == null) return 0;
    if (weather!.isEmpty) return 0;
    return weather![0].id ?? 0;
  }

  String _getWeatherIconPath() {
    if (weather == null) return '';
    if (weather!.isEmpty) return '';
    return 'https://openweathermap.org/img/wn/${weather![0].icon}@4x.png';
  }

  String _getWeatherCondition() {
    if (weather == null) return '';
    if (weather!.isEmpty) return '';
    return weather![0].main ?? '';
  }

  String _getCountryCode() {
    if (sys == null) return '';
    return sys!.country ?? '';
  }
}

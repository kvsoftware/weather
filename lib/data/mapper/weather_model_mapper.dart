import 'dart:convert';

import '../../domain/entity/daily_entity.dart';
import '../../domain/entity/hourly_entity.dart';
import '../../domain/entity/weather_entity.dart';
import '../datasource/local/model/weather_db_model.dart';
import '../datasource/remote/model/weather_api_model.dart';
import 'daily_model_mapper.dart';
import 'hourly_model_mapper.dart';

extension WeatherApiModelMapping on WeatherApiModel {
  WeatherEntity toWeatherEntity() {
    return WeatherEntity(
      lat: lat ?? 0,
      lon: lon ?? 0,
      temp: current?.temp ?? 0,
      weatherCode: _getWeatherCode(),
      weatherIcon: _getWeatherIconPath(),
      weatherCondition: _getWeatherCondition(),
      hourly: _getHours(),
      daily: _getDailies(),
      dt: _getDateTime(),
    );
  }

  WeatherDbModel toWeatherDbModel(String id) {
    return WeatherDbModel(
      id: id,
      lat: lat ?? 0,
      lon: lon ?? 0,
      temp: current?.temp ?? 0,
      weatherCode: _getWeatherCode(),
      weatherIcon: _getWeatherIconPath(),
      weatherCondition: _getWeatherCondition(),
      dt: current?.dt ?? 0,
      hourly: jsonEncode(hourly),
      daily: jsonEncode(daily),
    );
  }

  int _getWeatherCode() {
    if (current?.weather == null) return 0;
    if (current!.weather!.isEmpty) return 0;
    return current!.weather![0].id ?? 0;
  }

  String _getWeatherIconPath() {
    if (current?.weather == null) return '';
    if (current!.weather!.isEmpty) return '';
    return 'https://openweathermap.org/img/wn/${current!.weather![0].icon}@4x.png';
  }

  String _getWeatherCondition() {
    if (current?.weather == null) return '';
    if (current!.weather!.isEmpty) return '';
    return current!.weather![0].main ?? '';
  }

  DateTime _getDateTime() {
    if (current?.dt == null) DateTime.now();
    return DateTime.fromMillisecondsSinceEpoch(current!.dt! * 1000);
  }

  List<HourlyEntity> _getHours() {
    if (hourly == null) return [];
    return hourly!.map((e) => e.toHourlyEntity()).toList();
  }

  List<DailyEntity> _getDailies() {
    if (daily == null) return [];
    return daily!.map((e) => e.toDailyEntity()).toList();
  }
}

extension WeatherDbModelMapping on WeatherDbModel {
  WeatherEntity toWeatherEntity() {
    return WeatherEntity(
      lat: lat,
      lon: lon,
      temp: temp,
      weatherCode: weatherCode,
      weatherIcon: weatherIcon,
      weatherCondition: weatherCondition,
      hourly: _toHourlyEntities(),
      daily: _toDailyEntities(),
      dt: DateTime.fromMillisecondsSinceEpoch(dt * 1000),
    );
  }

  List<HourlyEntity> _toHourlyEntities() {
    final iterable = jsonDecode(hourly);
    final hourlyApiModels = List<HourlyApiModel>.from(iterable.map((model) => HourlyApiModel.fromJson(model)));
    final hourlyEntities = hourlyApiModels.map((e) => e.toHourlyEntity()).toList();
    return hourlyEntities;
  }

  List<DailyEntity> _toDailyEntities() {
    final iterable = jsonDecode(daily);
    final dailyApiModels = List<DailyApiModel>.from(iterable.map((model) => DailyApiModel.fromJson(model)));
    final dailyEntities = dailyApiModels.map((e) => e.toDailyEntity()).toList();
    return dailyEntities;
  }
}

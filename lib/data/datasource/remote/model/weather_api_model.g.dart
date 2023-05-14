// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApiModel _$WeatherApiModelFromJson(Map<String, dynamic> json) =>
    WeatherApiModel(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      current: json['current'] == null
          ? null
          : CurrentApiModel.fromJson(json['current'] as Map<String, dynamic>),
      hourly: (json['hourly'] as List<dynamic>?)
          ?.map((e) => HourlyApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => DailyApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherApiModelToJson(WeatherApiModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'current': instance.current,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };

CurrentApiModel _$CurrentApiModelFromJson(Map<String, dynamic> json) =>
    CurrentApiModel(
      dt: json['dt'] as int?,
      temp: (json['temp'] as num?)?.toDouble(),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) =>
              WeatherConditionApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrentApiModelToJson(CurrentApiModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'weather': instance.weather,
    };

HourlyApiModel _$HourlyApiModelFromJson(Map<String, dynamic> json) =>
    HourlyApiModel(
      dt: json['dt'] as int?,
      temp: (json['temp'] as num?)?.toDouble(),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) =>
              WeatherConditionApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HourlyApiModelToJson(HourlyApiModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'weather': instance.weather,
    };

DailyApiModel _$DailyApiModelFromJson(Map<String, dynamic> json) =>
    DailyApiModel(
      dt: json['dt'] as int?,
      temp: json['temp'] == null
          ? null
          : TempApiModel.fromJson(json['temp'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) =>
              WeatherConditionApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyApiModelToJson(DailyApiModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'weather': instance.weather,
    };

WeatherConditionApiModel _$WeatherConditionApiModelFromJson(
        Map<String, dynamic> json) =>
    WeatherConditionApiModel(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherConditionApiModelToJson(
        WeatherConditionApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

TempApiModel _$TempApiModelFromJson(Map<String, dynamic> json) => TempApiModel(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TempApiModelToJson(TempApiModel instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastWeatherEntity _$ForecastWeatherEntityFromJson(
        Map<String, dynamic> json) =>
    ForecastWeatherEntity(
      temp: json['temp'] as int?,
      tempMin: json['tempMin'] as int?,
      tempMax: json['tempMax'] as int?,
      dateTime: json['dateTime'] as String?,
      weatherIconPath: json['weatherIconPath'] as String?,
      weatherCondition: json['weatherCondition'] as String?,
    );

Map<String, dynamic> _$ForecastWeatherEntityToJson(
        ForecastWeatherEntity instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'dateTime': instance.dateTime,
      'weatherIconPath': instance.weatherIconPath,
      'weatherCondition': instance.weatherCondition,
    };

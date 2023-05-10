// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApiModel _$WeatherApiModelFromJson(Map<String, dynamic> json) =>
    WeatherApiModel(
      coord: json['coord'] == null
          ? null
          : CoordinateApiModel.fromJson(json['coord'] as Map<String, dynamic>),
      main: json['main'] == null
          ? null
          : MainApiModel.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) =>
              WeatherConditionApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sys: json['sys'] == null
          ? null
          : SysApiModel.fromJson(json['sys'] as Map<String, dynamic>),
      dt: json['dt'] as int?,
    );

Map<String, dynamic> _$WeatherApiModelToJson(WeatherApiModel instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'main': instance.main,
      'weather': instance.weather,
      'sys': instance.sys,
      'dt': instance.dt,
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

MainApiModel _$MainApiModelFromJson(Map<String, dynamic> json) => MainApiModel(
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      tempMin: (json['temp_min'] as num?)?.toDouble(),
      tempMax: (json['temp_max'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
    );

Map<String, dynamic> _$MainApiModelToJson(MainApiModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

CoordinateApiModel _$CoordinateApiModelFromJson(Map<String, dynamic> json) =>
    CoordinateApiModel(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinateApiModelToJson(CoordinateApiModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

SysApiModel _$SysApiModelFromJson(Map<String, dynamic> json) => SysApiModel(
      country: json['country'] as String?,
    );

Map<String, dynamic> _$SysApiModelToJson(SysApiModel instance) =>
    <String, dynamic>{
      'country': instance.country,
    };

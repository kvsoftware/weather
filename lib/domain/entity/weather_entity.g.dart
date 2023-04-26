// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherEntity _$WeatherEntityFromJson(Map<String, dynamic> json) =>
    WeatherEntity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      temp: (json['temp'] as num?)?.toDouble(),
      tempMin: (json['tempMin'] as num?)?.toDouble(),
      tempMax: (json['tempMax'] as num?)?.toDouble(),
      weatherIcon: json['weatherIcon'] as String?,
      weatherCondition: json['weatherCondition'] as String?,
      dt: json['dt'] == null ? null : DateTime.parse(json['dt'] as String),
    );

Map<String, dynamic> _$WeatherEntityToJson(WeatherEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'temp': instance.temp,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'weatherIcon': instance.weatherIcon,
      'weatherCondition': instance.weatherCondition,
      'dt': instance.dt?.toIso8601String(),
    };

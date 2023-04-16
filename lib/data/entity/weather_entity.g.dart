// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherEntity _$WeatherEntityFromJson(Map<String, dynamic> json) =>
    WeatherEntity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      weather: (json['weather'] as List<dynamic>?)
          ?.map(
              (e) => WeatherConditionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: json['main'] == null
          ? null
          : MainEntity.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherEntityToJson(WeatherEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weather': instance.weather,
      'main': instance.main,
    };

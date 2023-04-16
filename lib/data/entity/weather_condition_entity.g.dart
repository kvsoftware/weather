// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_condition_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherConditionEntity _$WeatherConditionEntityFromJson(
        Map<String, dynamic> json) =>
    WeatherConditionEntity(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherConditionEntityToJson(
        WeatherConditionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

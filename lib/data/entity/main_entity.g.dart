// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainEntity _$MainEntityFromJson(Map<String, dynamic> json) => MainEntity(
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      tempMin: (json['temp_min'] as num?)?.toDouble(),
      tempMax: (json['temp_max'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
    );

Map<String, dynamic> _$MainEntityToJson(MainEntity instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

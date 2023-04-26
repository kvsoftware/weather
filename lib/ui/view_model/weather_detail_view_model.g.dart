// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_detail_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDetailViewModel _$WeatherDetailViewModelFromJson(
        Map<String, dynamic> json) =>
    WeatherDetailViewModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      temp: (json['temp'] as num?)?.toDouble(),
      tempMin: (json['tempMin'] as num?)?.toDouble(),
      tempMax: (json['tempMax'] as num?)?.toDouble(),
      weatherIcon: json['weatherIcon'] as String?,
      weatherCondition: json['weatherCondition'] as String?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$WeatherDetailViewModelToJson(
        WeatherDetailViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temp': instance.temp,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'weatherIcon': instance.weatherIcon,
      'weatherCondition': instance.weatherCondition,
      'dateTime': instance.dateTime?.toIso8601String(),
    };

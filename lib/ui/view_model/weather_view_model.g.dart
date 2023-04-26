// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherViewModel _$WeatherViewModelFromJson(Map<String, dynamic> json) =>
    WeatherViewModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      temp: (json['temp'] as num?)?.toDouble(),
      weatherIcon: json['weatherIcon'] as String?,
    );

Map<String, dynamic> _$WeatherViewModelToJson(WeatherViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temp': instance.temp,
      'weatherIcon': instance.weatherIcon,
    };

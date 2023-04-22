// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      cityName: json['cityName'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      country: json['country'] as String?,
      state: json['state'] as String?,
      temp: (json['temp'] as num?)?.toDouble(),
      dateTime: json['dateTime'] as String?,
      weatherIconPath: json['weatherIconPath'] as String?,
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cityName': instance.cityName,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
      'state': instance.state,
      'temp': instance.temp,
      'dateTime': instance.dateTime,
      'weatherIconPath': instance.weatherIconPath,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDetailModel _$WeatherDetailModelFromJson(Map<String, dynamic> json) =>
    WeatherDetailModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      cityName: json['cityName'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      country: json['country'] as String?,
      state: json['state'] as String?,
      temp: json['temp'] as int?,
      tempMin: json['tempMin'] as int?,
      tempMax: json['tempMax'] as int?,
      dateTime: json['dateTime'] as String?,
      weatherIconPath: json['weatherIconPath'] as String?,
      weatherCondition: json['weatherCondition'] as String?,
    );

Map<String, dynamic> _$WeatherDetailModelToJson(WeatherDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cityName': instance.cityName,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
      'state': instance.state,
      'temp': instance.temp,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'dateTime': instance.dateTime,
      'weatherIconPath': instance.weatherIconPath,
      'weatherCondition': instance.weatherCondition,
    };

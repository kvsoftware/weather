// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApiModel _$WeatherApiModelFromJson(Map<String, dynamic> json) =>
    WeatherApiModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      coord: json['coord'] == null
          ? null
          : CoordinateModel.fromJson(json['coord'] as Map<String, dynamic>),
      main: json['main'] == null
          ? null
          : MainModel.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) =>
              WeatherConditionApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dt: json['dt'] as int?,
    );

Map<String, dynamic> _$WeatherApiModelToJson(WeatherApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'main': instance.main,
      'weather': instance.weather,
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

MainModel _$MainModelFromJson(Map<String, dynamic> json) => MainModel(
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      tempMin: (json['temp_min'] as num?)?.toDouble(),
      tempMax: (json['temp_max'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
    );

Map<String, dynamic> _$MainModelToJson(MainModel instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

CoordinateModel _$CoordinateModelFromJson(Map<String, dynamic> json) =>
    CoordinateModel(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinateModelToJson(CoordinateModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinateModel _$CoordinateModelFromJson(Map<String, dynamic> json) =>
    CoordinateModel(
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      country: json['country'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$CoordinateModelToJson(CoordinateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
      'state': instance.state,
    };

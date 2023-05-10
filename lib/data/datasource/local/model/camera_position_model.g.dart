// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_position_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CameraPositionModel _$CameraPositionModelFromJson(Map<String, dynamic> json) =>
    CameraPositionModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      zoom: (json['zoom'] as num).toDouble(),
    );

Map<String, dynamic> _$CameraPositionModelToJson(
        CameraPositionModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'zoom': instance.zoom,
    };

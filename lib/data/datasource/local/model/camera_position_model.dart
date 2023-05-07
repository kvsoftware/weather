import 'package:json_annotation/json_annotation.dart';

part 'camera_position_model.g.dart';

@JsonSerializable()
class CameraPositionModel {
  final double latitude;
  final double longitude;
  final double zoom;

  CameraPositionModel({required this.latitude, required this.longitude, required this.zoom});

  factory CameraPositionModel.fromJson(Map<String, dynamic> json) => _$CameraPositionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CameraPositionModelToJson(this);
}

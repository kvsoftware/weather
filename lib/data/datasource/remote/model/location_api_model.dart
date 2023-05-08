import 'package:json_annotation/json_annotation.dart';

part 'location_api_model.g.dart';

@JsonSerializable()
class LocationApiModel {
  String? name;
  double? lat;
  double? lon;
  String? country;
  String? state;

  LocationApiModel({
    this.name,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  factory LocationApiModel.fromJson(Map<String, dynamic> json) =>
      _$LocationApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationApiModelToJson(this);
}

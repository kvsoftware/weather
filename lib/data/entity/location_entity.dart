import 'package:json_annotation/json_annotation.dart';

part 'location_entity.g.dart';

@JsonSerializable()
class LocationEntity {
  String? name;
  double? lat;
  double? lon;
  String? country;
  String? state;

  LocationEntity({
    this.name,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  factory LocationEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocationEntityToJson(this);
}

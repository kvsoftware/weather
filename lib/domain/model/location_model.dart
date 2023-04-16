import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  String? name;
  double? lat;
  double? lon;
  String? country;
  String? state;

  LocationModel({this.name, this.lat, this.lon, this.country, this.state});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

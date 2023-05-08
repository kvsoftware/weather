import 'package:json_annotation/json_annotation.dart';

part 'country_api_model.g.dart';

@JsonSerializable()
class CountryApiModel {
  NameApiModel? name;

  CountryApiModel({this.name});

  factory CountryApiModel.fromJson(Map<String, dynamic> json) => _$CountryApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryApiModelToJson(this);
}

@JsonSerializable()
class NameApiModel {
  String? common;

  NameApiModel({this.common});

  factory NameApiModel.fromJson(Map<String, dynamic> json) => _$NameApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$NameApiModelToJson(this);
}

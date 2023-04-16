import 'package:json_annotation/json_annotation.dart';

part 'weather_condition_entity.g.dart';

@JsonSerializable()
class WeatherConditionEntity {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherConditionEntity({this.id, this.main, this.description, this.icon});

  factory WeatherConditionEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionEntityToJson(this);
}

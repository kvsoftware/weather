import 'package:json_annotation/json_annotation.dart';

part 'weather_condition_model.g.dart';

@JsonSerializable()
class WeatherConditionModel {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherConditionModel({this.id, this.main, this.description, this.icon});

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionModelToJson(this);
}

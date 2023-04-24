import 'package:json_annotation/json_annotation.dart';

import 'main_model.dart';
import 'weather_condition_model.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  int? id;
  String? name;
  List<WeatherConditionModel>? weather;
  MainModel? main;
  int? dt;

  WeatherModel({this.id, this.name, this.weather, this.main, this.dt});

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

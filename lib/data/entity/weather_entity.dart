import 'package:json_annotation/json_annotation.dart';
import 'weather_condition_entity.dart';

import 'main_entity.dart';

part 'weather_entity.g.dart';

@JsonSerializable()
class WeatherEntity {
  int? id;
  String? name;
  List<WeatherConditionEntity>? weather;
  MainEntity? main;

  WeatherEntity({this.id, this.name, this.weather, this.main});

  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherEntityToJson(this);
}

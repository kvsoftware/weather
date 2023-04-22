import 'package:json_annotation/json_annotation.dart';

import 'main_entity.dart';
import 'weather_condition_entity.dart';

part 'weather_entity.g.dart';

@JsonSerializable()
class WeatherEntity {
  int? id;
  String? name;
  List<WeatherConditionEntity>? weather;
  MainEntity? main;
  int? dt;

  WeatherEntity({this.id, this.name, this.weather, this.main, this.dt});

  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherEntityToJson(this);
}

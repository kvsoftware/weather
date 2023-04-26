import 'package:json_annotation/json_annotation.dart';

part 'weather_entity.g.dart';

@JsonSerializable()
class WeatherEntity {
  int? id;
  String? name;
  String? country;
  double? lat;
  double? lon;
  double? temp;
  double? tempMin;
  double? tempMax;
  String? weatherIcon;
  String? weatherCondition;
  DateTime? dt;

  WeatherEntity({
    this.id,
    this.name,
    this.country,
    this.lat,
    this.lon,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.weatherIcon,
    this.weatherCondition,
    this.dt,
  });

  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherEntityToJson(this);
}

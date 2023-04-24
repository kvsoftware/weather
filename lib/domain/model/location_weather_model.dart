import 'package:json_annotation/json_annotation.dart';

part 'location_weather_model.g.dart';

@JsonSerializable()
class LocationWeatherModel {
  int? id;
  String? name;
  String? cityName;
  double? lat;
  double? lon;
  String? country;
  String? state;
  int? temp;
  int? tempMin;
  int? tempMax;
  String? dateTime;
  String? weatherIconPath;
  String? weatherCondition;

  LocationWeatherModel({
    this.id,
    this.name,
    this.cityName,
    this.lat,
    this.lon,
    this.country,
    this.state,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.dateTime,
    this.weatherIconPath,
    this.weatherCondition,
  });

  factory LocationWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$LocationWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationWeatherModelToJson(this);
}

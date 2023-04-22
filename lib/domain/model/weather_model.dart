import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  int? id;
  String? name;
  String? cityName;
  double? lat;
  double? lon;
  String? country;
  String? state;
  double? temp;
  String? dateTime;
  String? weatherIconPath;

  WeatherModel({
    this.id,
    this.name,
    this.cityName,
    this.lat,
    this.lon,
    this.country,
    this.state,
    this.temp,
    this.dateTime,
    this.weatherIconPath,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

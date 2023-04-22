import 'package:json_annotation/json_annotation.dart';

part 'weather_detail_model.g.dart';

@JsonSerializable()
class WeatherDetailModel {
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

  WeatherDetailModel({
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

  factory WeatherDetailModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDetailModelToJson(this);
}

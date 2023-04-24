import 'package:json_annotation/json_annotation.dart';

part 'forecast_weather_model.g.dart';

@JsonSerializable()
class ForecastWeatherModel {
  int? temp;
  int? tempMin;
  int? tempMax;
  String? dateTime;
  String? weatherIconPath;
  String? weatherCondition;

  ForecastWeatherModel({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.dateTime,
    this.weatherIconPath,
    this.weatherCondition,
  });

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastWeatherModelToJson(this);
}

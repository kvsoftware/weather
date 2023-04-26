import 'package:json_annotation/json_annotation.dart';

part 'forecast_weather_entity.g.dart';

@JsonSerializable()
class ForecastWeatherEntity {
  int? temp;
  int? tempMin;
  int? tempMax;
  String? dateTime;
  String? weatherIconPath;
  String? weatherCondition;

  ForecastWeatherEntity({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.dateTime,
    this.weatherIconPath,
    this.weatherCondition,
  });

  factory ForecastWeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$ForecastWeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastWeatherEntityToJson(this);
}

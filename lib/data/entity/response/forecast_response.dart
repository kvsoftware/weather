import 'package:json_annotation/json_annotation.dart';

import '../weather_entity.dart';

part 'forecast_response.g.dart';

@JsonSerializable()
class ForecastResponse {
  List<WeatherEntity>? list;

  ForecastResponse({this.list});

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastResponseToJson(this);
}

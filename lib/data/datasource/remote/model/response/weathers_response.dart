import 'package:json_annotation/json_annotation.dart';

import '../weather_api_model.dart';

part 'weathers_response.g.dart';

@JsonSerializable()
class WeathersResponse {
  List<WeatherApiModel>? list;

  WeathersResponse({this.list});

  factory WeathersResponse.fromJson(Map<String, dynamic> json) => _$WeathersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeathersResponseToJson(this);
}

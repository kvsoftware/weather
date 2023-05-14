import 'package:json_annotation/json_annotation.dart';

part 'weather_api_model.g.dart';

@JsonSerializable()
class WeatherApiModel {
  double? lat;
  double? lon;
  CurrentApiModel? current;
  List<HourlyApiModel>? hourly;
  List<DailyApiModel>? daily;

  WeatherApiModel({this.lat, this.lon, this.current, this.hourly, this.daily});

  factory WeatherApiModel.fromJson(Map<String, dynamic> json) => _$WeatherApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherApiModelToJson(this);
}

@JsonSerializable()
class CurrentApiModel {
  int? dt;
  double? temp;
  List<WeatherConditionApiModel>? weather;

  CurrentApiModel({this.dt, this.temp, this.weather});

  factory CurrentApiModel.fromJson(Map<String, dynamic> json) => _$CurrentApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentApiModelToJson(this);
}

@JsonSerializable()
class HourlyApiModel {
  int? dt;
  double? temp;
  List<WeatherConditionApiModel>? weather;

  HourlyApiModel({this.dt, this.temp, this.weather});

  factory HourlyApiModel.fromJson(Map<String, dynamic> json) => _$HourlyApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyApiModelToJson(this);
}

@JsonSerializable()
class DailyApiModel {
  int? dt;
  TempApiModel? temp;
  List<WeatherConditionApiModel>? weather;

  DailyApiModel({this.dt, this.temp, this.weather});

  factory DailyApiModel.fromJson(Map<String, dynamic> json) => _$DailyApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyApiModelToJson(this);
}

@JsonSerializable()
class WeatherConditionApiModel {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherConditionApiModel({this.id, this.main, this.description, this.icon});

  factory WeatherConditionApiModel.fromJson(Map<String, dynamic> json) => _$WeatherConditionApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionApiModelToJson(this);
}

@JsonSerializable()
class TempApiModel {
  double? min;
  double? max;

  TempApiModel({this.min, this.max});

  factory TempApiModel.fromJson(Map<String, dynamic> json) => _$TempApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$TempApiModelToJson(this);
}

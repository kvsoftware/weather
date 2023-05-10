import 'package:json_annotation/json_annotation.dart';

part 'weather_api_model.g.dart';

@JsonSerializable()
class WeatherApiModel {
  CoordinateApiModel? coord;
  MainApiModel? main;
  List<WeatherConditionApiModel>? weather;
  SysApiModel? sys;
  int? dt;

  WeatherApiModel({this.coord, this.main, this.weather, this.sys, this.dt});

  factory WeatherApiModel.fromJson(Map<String, dynamic> json) => _$WeatherApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherApiModelToJson(this);
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
class MainApiModel {
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  @JsonKey(name: 'temp_min')
  double? tempMin;
  @JsonKey(name: 'temp_max')
  double? tempMax;
  int? pressure;
  int? humidity;

  MainApiModel({this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity});

  factory MainApiModel.fromJson(Map<String, dynamic> json) => _$MainApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainApiModelToJson(this);
}

@JsonSerializable()
class CoordinateApiModel {
  double? lat;
  double? lon;

  CoordinateApiModel({this.lat, this.lon});

  factory CoordinateApiModel.fromJson(Map<String, dynamic> json) => _$CoordinateApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateApiModelToJson(this);
}

@JsonSerializable()
class SysApiModel {
  String? country;

  SysApiModel({this.country});

  factory SysApiModel.fromJson(Map<String, dynamic> json) => _$SysApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$SysApiModelToJson(this);
}

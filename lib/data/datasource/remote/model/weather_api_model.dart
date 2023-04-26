import 'package:json_annotation/json_annotation.dart';

part 'weather_api_model.g.dart';

@JsonSerializable()
class WeatherApiModel {
  int? id;
  String? name;
  CoordinateModel? coord;
  MainModel? main;
  List<WeatherConditionApiModel>? weather;
  int? dt;

  WeatherApiModel({
    this.id,
    this.name,
    this.coord,
    this.main,
    this.weather,
    this.dt,
  });

  factory WeatherApiModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherApiModelToJson(this);
}

@JsonSerializable()
class WeatherConditionApiModel {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherConditionApiModel({this.id, this.main, this.description, this.icon});

  factory WeatherConditionApiModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionApiModelToJson(this);
}

@JsonSerializable()
class MainModel {
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  @JsonKey(name: 'temp_min')
  double? tempMin;
  @JsonKey(name: 'temp_max')
  double? tempMax;
  int? pressure;
  int? humidity;

  MainModel(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);
}

@JsonSerializable()
class CoordinateModel {
  double? lat;
  double? lon;

  CoordinateModel({this.lat, this.lon});

  factory CoordinateModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateModelToJson(this);
}

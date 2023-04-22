import 'package:json_annotation/json_annotation.dart';

part 'main_entity.g.dart';

@JsonSerializable()
class MainEntity {
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  @JsonKey(name: 'temp_min')
  double? tempMin;
  @JsonKey(name: 'temp_max')
  double? tempMax;
  int? pressure;
  int? humidity;

  MainEntity(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  factory MainEntity.fromJson(Map<String, dynamic> json) =>
      _$MainEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MainEntityToJson(this);
}

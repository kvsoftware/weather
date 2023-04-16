import 'package:json_annotation/json_annotation.dart';

part 'main_entity.g.dart';

@JsonSerializable()
class MainEntity {
  double? temp;
  double? feelsLike;
  double? tempMin;
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

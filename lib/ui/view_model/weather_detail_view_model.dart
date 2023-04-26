import 'package:json_annotation/json_annotation.dart';

part 'weather_detail_view_model.g.dart';

@JsonSerializable()
class WeatherDetailViewModel {
  int? id;
  String? name;
  double? temp;
  double? tempMin;
  double? tempMax;
  String? weatherIcon;
  String? weatherCondition;
  DateTime? dateTime;

  WeatherDetailViewModel(
      {this.id,
      this.name,
      this.temp,
      this.tempMin,
      this.tempMax,
      this.weatherIcon,
      this.weatherCondition,
      this.dateTime});

  factory WeatherDetailViewModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDetailViewModelToJson(this);
}

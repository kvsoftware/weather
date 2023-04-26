import 'package:json_annotation/json_annotation.dart';

part 'weather_view_model.g.dart';

@JsonSerializable()
class WeatherViewModel {
  int? id;
  String? name;
  double? temp;
  String? weatherIcon;

  WeatherViewModel({
    this.id,
    this.name,
    this.temp,
    this.weatherIcon,
  });

  factory WeatherViewModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherViewModelToJson(this);
}

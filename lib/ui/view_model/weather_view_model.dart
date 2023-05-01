import 'dart:ui';

class WeatherViewModel {
  int? id;
  String? name;
  double? temp;
  String? weatherIcon;
  Color? color;

  WeatherViewModel({
    required this.id,
    required this.name,
    required this.temp,
    required this.weatherIcon,
    required this.color,
  });
}

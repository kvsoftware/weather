import 'dart:ui';

class WeatherViewModel {
  int? id;
  String? name;
  String? countryName;
  int? temp;
  String? weatherIcon;
  Color? color;

  WeatherViewModel({
    required this.id,
    required this.name,
    required this.countryName,
    required this.temp,
    required this.weatherIcon,
    required this.color,
  });
}

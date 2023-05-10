import 'dart:ui';

class WeatherViewModel {
  String id;
  String name;
  String stateWithCountryName;
  int temp;
  String weatherIcon;
  Color color;

  WeatherViewModel({
    required this.id,
    required this.name,
    required this.stateWithCountryName,
    required this.temp,
    required this.weatherIcon,
    required this.color,
  });
}

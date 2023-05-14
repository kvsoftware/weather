import 'dart:ui';

import 'daily_view_model.dart';

class WeatherViewModel {
  String id;
  String name;
  String stateWithCountryName;
  int temp;
  String weatherIcon;
  Color color;
  List<DailyViewModel> dailies;

  WeatherViewModel({
    required this.id,
    required this.name,
    required this.stateWithCountryName,
    required this.temp,
    required this.weatherIcon,
    required this.color,
    required this.dailies,
  });
}

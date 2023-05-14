import 'dart:ui';

import 'daily_view_model.dart';

class WeatherDetailViewModel {
  String id;
  String name;
  String countryName;
  int temp;
  String weatherIcon;
  String weatherCondition;
  List<DailyViewModel> dailies;
  Color color;
  DateTime dateTime;

  WeatherDetailViewModel({
    required this.id,
    required this.name,
    required this.countryName,
    required this.temp,
    required this.weatherIcon,
    required this.weatherCondition,
    required this.dailies,
    required this.color,
    required this.dateTime,
  });
}

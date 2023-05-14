import 'dart:ui';

import 'daily_view_model.dart';
import 'hourly_view_model.dart';

class WeatherDetailViewModel {
  String id;
  String name;
  String state;
  String countryName;
  int temp;
  String weatherIcon;
  String weatherCondition;
  List<HourlyViewModel> hourlies;
  List<DailyViewModel> dailies;
  Color color;
  DateTime dateTime;

  WeatherDetailViewModel({
    required this.id,
    required this.name,
    required this.state,
    required this.countryName,
    required this.temp,
    required this.weatherIcon,
    required this.weatherCondition,
    required this.hourlies,
    required this.dailies,
    required this.color,
    required this.dateTime,
  });
}

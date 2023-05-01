import 'package:flutter/material.dart';

import '../../ui/view_model/weather_detail_view_model.dart';
import '../../ui/view_model/weather_view_model.dart';
import '../entity/weather_entity.dart';

extension WeatherViewModelMapper on WeatherEntity {
  WeatherViewModel toWeatherViewModel() {
    return WeatherViewModel(
      id: id,
      name: name,
      temp: temp?.roundToDouble(),
      weatherIcon: weatherIcon,
      color: _getColor(),
    );
  }

  WeatherDetailViewModel toWeatherDetailViewModel() {
    return WeatherDetailViewModel(
        id: id,
        name: name,
        temp: temp?.roundToDouble(),
        tempMin: tempMin?.roundToDouble(),
        tempMax: tempMax?.roundToDouble(),
        weatherIcon: weatherIcon,
        weatherCondition: weatherCondition,
        color: _getColor(),
        dateTime: dt);
  }

  Color _getColor() {
    if (weatherCode == null) return Colors.white;
    if (weatherCode! >= 200 && weatherCode! < 300) return const Color(0xFFBDBDBD);
    if (weatherCode! >= 300 && weatherCode! < 400) return const Color(0xFFD1C4E9);
    if (weatherCode! >= 500 && weatherCode! < 600) return const Color(0xFFBBDEFB);
    if (weatherCode! >= 600 && weatherCode! < 700) return const Color(0xFFE0E0E0);
    if (weatherCode! >= 700 && weatherCode! < 800) return const Color(0xFFECEFF1);
    if (weatherCode! == 800) return const Color(0xFFB2EBF2);
    if (weatherCode! >= 801 && weatherCode! < 810) return const Color(0xFFE0E0E0);
    return Colors.white;
  }
}

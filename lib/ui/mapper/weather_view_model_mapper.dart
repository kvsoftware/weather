import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entity/location_weather_country_entity.dart';
import '../page/location_detail/location_detail_view.dart';
import '../routes/app_pages.dart';
import '../view_model/daily_view_model.dart';
import '../view_model/hourly_view_model.dart';
import '../view_model/weather_detail_view_model.dart';
import '../view_model/weather_view_model.dart';
import 'daily_view_model_mapper.dart';
import 'hourly_view_model_mapper.dart';

extension LocationWeatherCountryEntityMapper on LocationWeatherCountryEntity {
  WeatherViewModel toWeatherViewModel() {
    return WeatherViewModel(
      id: location.getId(),
      name: location.name,
      stateWithCountryName: "${location.state} / ${country?.name ?? '-'}",
      temp: weather.temp.round(),
      weatherIcon: weather.weatherIcon,
      color: _getColor(),
      hourlies: _getHourlies(),
      dailies: _getDailies(),
    );
  }

  WeatherDetailViewModel toWeatherDetailViewModel() {
    return WeatherDetailViewModel(
      id: location.getId(),
      name: location.name,
      state: location.state,
      countryName: country?.name ?? '-',
      temp: weather.temp.round(),
      weatherIcon: weather.weatherIcon,
      weatherCondition: weather.weatherCondition,
      hourlies: _getHourlies(),
      dailies: _getDailies(),
      color: _getColor(),
      dateTime: weather.dt,
    );
  }

  Marker toMarker() {
    return Marker(
      markerId: MarkerId(location.getId()),
      position: LatLng(weather.lat, weather.lon),
      infoWindow: InfoWindow(
        title: location.name,
        snippet: "${weather.temp.round()}°",
        onTap: () => Get.toNamed(
          Routes.LOCATION_DETAIL,
          arguments: LocationDetailArgument(location.getId()),
        ),
      ),
      flat: true,
    );
  }

  Color _getColor() {
    if (weather.weatherCode >= 200 && weather.weatherCode < 300) return const Color(0xFFBDBDBD);
    if (weather.weatherCode >= 300 && weather.weatherCode < 400) return const Color(0xFFD1C4E9);
    if (weather.weatherCode >= 500 && weather.weatherCode < 600) return const Color(0xFFBBDEFB);
    if (weather.weatherCode >= 600 && weather.weatherCode < 700) return const Color(0xFFE0E0E0);
    if (weather.weatherCode >= 700 && weather.weatherCode < 800) return const Color(0xFFECEFF1);
    if (weather.weatherCode == 800) return const Color(0xFFB2EBF2);
    if (weather.weatherCode >= 801 && weather.weatherCode < 810) return const Color(0xFFE0E0E0);
    return Colors.white;
  }

  List<HourlyViewModel> _getHourlies() {
    return weather.hourly.map((e) => e.toHourlyViewModel()).toList();
  }

  List<DailyViewModel> _getDailies() {
    return weather.daily.map((e) => e.toDailyViewModel()).toList();
  }
}

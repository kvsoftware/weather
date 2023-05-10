import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entity/location_weather_country_entity.dart';
import '../page/location_detail/location_detail_view.dart';
import '../routes/app_pages.dart';
import '../view_model/weather_detail_view_model.dart';
import '../view_model/weather_view_model.dart';

extension LocationWeatherCountryEntityMapper on LocationWeatherCountryEntity {
  WeatherViewModel toWeatherViewModel() {
    return WeatherViewModel(
      id: location.getId(),
      name: location.name,
      stateWithCountryName: "${location.state} / ${country?.name ?? '-'}",
      temp: weather.temp.round(),
      weatherIcon: weather.weatherIcon,
      color: _getColor(),
    );
  }

  WeatherDetailViewModel toWeatherDetailViewModel() {
    return WeatherDetailViewModel(
      id: location.getId(),
      name: location.name,
      temp: weather.temp.round(),
      tempMin: weather.tempMin.round(),
      tempMax: weather.tempMax.round(),
      weatherIcon: weather.weatherIcon,
      weatherCondition: weather.weatherCondition,
      color: _getColor(),
      dateTime: weather.dt,
      countryName: country?.name ?? '-',
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
}

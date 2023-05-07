import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entity/weather_entity.dart';
import '../page/location_detail/location_detail_view.dart';
import '../routes/app_pages.dart';
import '../view_model/weather_detail_view_model.dart';
import '../view_model/weather_view_model.dart';

extension WeatherEntitylMapper on WeatherEntity {
  WeatherViewModel toWeatherViewModel() {
    return WeatherViewModel(
      id: id,
      name: name,
      temp: temp?.round(),
      weatherIcon: weatherIcon,
      color: _getColor(),
    );
  }

  WeatherDetailViewModel toWeatherDetailViewModel() {
    return WeatherDetailViewModel(
        id: id,
        name: name,
        temp: temp?.round(),
        tempMin: tempMin?.round(),
        tempMax: tempMax?.round(),
        weatherIcon: weatherIcon,
        weatherCondition: weatherCondition,
        color: _getColor(),
        dateTime: dt);
  }

  Marker toMarker() {
    return Marker(
      markerId: MarkerId(id.toString()),
      position: LatLng(lat ?? 0, lon ?? 0),
      infoWindow: InfoWindow(
        title: name,
        snippet: "${temp?.round()}°",
        onTap: () => Get.toNamed(
          Routes.LOCATION_DETAIL,
          arguments: LocationDetailArgument(id ?? 0),
        ),
      ),
      flat: true,
    );
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

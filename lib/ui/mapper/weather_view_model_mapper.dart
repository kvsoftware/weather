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
import 'icon_mapper.dart';

extension LocationWeatherCountryEntityMapper on LocationWeatherCountryEntity {
  WeatherViewModel toWeatherViewModel() {
    return WeatherViewModel(
      id: location.getId(),
      name: location.name,
      stateWithCountryName: "${location.state} / ${country?.name ?? '-'}",
      temp: weather.temp.round(),
      weatherIcon: getIcon(weather.weatherIcon),
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
      weatherIcon: getIcon(weather.weatherIcon),
      weatherCondition: weather.weatherCondition,
      hourlies: _getHourlies(),
      dailies: _getDailies(),
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

  List<HourlyViewModel> _getHourlies() {
    return weather.hourly.map((e) => e.toHourlyViewModel()).toList();
  }

  List<DailyViewModel> _getDailies() {
    return weather.daily.map((e) => e.toDailyViewModel()).toList();
  }
}

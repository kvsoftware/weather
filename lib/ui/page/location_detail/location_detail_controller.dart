import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../../../domain/entity/forecast_weather_entity.dart';
import '../../../../domain/use_case/favorite_location_weather_use_case.dart';
import '../../../../domain/use_case/is_favorite_weather_use_case.dart';
import '../../../domain/use_case/get_forecast_weathers_by_location_id_use_case.dart';
import '../../../domain/use_case/get_weather_by_location_id_use_case.dart';
import '../../mapper/weather_view_model_mapper.dart';
import '../../view_model/weather_detail_view_model.dart';
import 'location_detail_view.dart';

class LocationDetailController extends GetxController {
  final GetWeatherByIdUseCase _getWeatherByIdUseCase;
  final GetForecastWeathersByLocationIdUseCase _getForecastWeathersByLocationIdUseCase;
  final FavoriteLocationWeatherUseCase _favoriteLocationWeatherUseCase;
  final IsFavoriteWeatherUseCase _isFavoriteWeatherUseCase;

  LocationDetailController(
    this._getWeatherByIdUseCase,
    this._getForecastWeathersByLocationIdUseCase,
    this._favoriteLocationWeatherUseCase,
    this._isFavoriteWeatherUseCase,
  );

  final isLoading = false.obs;
  final isOffline = false.obs;
  final weatherDetail = Rxn<WeatherDetailViewModel>();
  final forecastWeathers = <ForecastWeatherEntity>[].obs;
  final isFavorited = false.obs;

  bool isLoadingWeather = false;
  bool isLoadingForecast = false;

  late StreamSubscription subscription;

  @override
  void onInit() {
    super.onInit();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isOffline(result == ConnectivityResult.none);
    });
  }

  @override
  void onReady() {
    super.onReady();
    final locationId = (Get.arguments as LocationDetailArgument).id;
    _getWeatherByLocationId(locationId);
    _getForecastWeathersByLocationId(locationId);
    _getStatusFavorite(locationId);
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }

  void updateFavorite() async {
    if (weatherDetail.value?.id == null) return;
    final id = weatherDetail.value!.id;
    _setFavorite(id, !isFavorited.value);
    isFavorited(!isFavorited.value);
  }

  Future<void> onRefresh() async {
    final locationId = (Get.arguments as LocationDetailArgument).id;
    _getWeatherByLocationId(locationId);
    _getForecastWeathersByLocationId(locationId);
    _getStatusFavorite(locationId);
  }

  void _getWeatherByLocationId(String locationId) async {
    _isLoading(isLoadingWeather: true);
    try {
      var response = (await _getWeatherByIdUseCase.invoke(locationId));
      weatherDetail(response?.toWeatherDetailViewModel());
    } catch (e) {
      // Do nothing
    }
    _isLoading(isLoadingWeather: false);
  }

  void _getForecastWeathersByLocationId(String locationId) async {
    _isLoading(isLoadingForecast: true);
    try {
      var response = await _getForecastWeathersByLocationIdUseCase.invoke(locationId);
      forecastWeathers(response);
    } catch (e) {
      // Do nothing
    }
    _isLoading(isLoadingForecast: false);
  }

  void _isLoading({bool? isLoadingWeather, bool? isLoadingForecast}) {
    if (isLoadingWeather != null) {
      this.isLoadingWeather = isLoadingWeather;
    }
    if (isLoadingForecast != null) {
      this.isLoadingForecast = isLoadingForecast;
    }
    isLoading(this.isLoadingWeather || this.isLoadingForecast);
  }

  void _setFavorite(String weatherId, bool isFavorited) async {
    try {
      await _favoriteLocationWeatherUseCase.invoke(weatherId, isFavorited);
    } catch (e) {
      // Do nothing
    }
  }

  void _getStatusFavorite(String weatherId) async {
    try {
      isFavorited(await _isFavoriteWeatherUseCase.invoke(weatherId));
    } catch (e) {
      // Do nothing
    }
  }
}

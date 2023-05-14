import 'dart:async';

import 'package:get/get.dart';

import '../../../../domain/use_case/favorite_location_weather_use_case.dart';
import '../../../../domain/use_case/is_favorite_weather_use_case.dart';
import '../../../domain/manager/favorite_manager.dart';
import '../../../domain/use_case/get_weather_by_location_id_use_case.dart';
import '../../base_controller.dart';
import '../../mapper/weather_view_model_mapper.dart';
import '../../view_model/weather_detail_view_model.dart';
import 'location_detail_view.dart';

class LocationDetailController extends BaseController {
  final FavoriteManager _favoriteManager;
  final GetWeatherByIdUseCase _getWeatherByIdUseCase;
  final FavoriteLocationWeatherUseCase _favoriteLocationWeatherUseCase;
  final IsFavoriteWeatherUseCase _isFavoriteWeatherUseCase;

  LocationDetailController(
    this._favoriteManager,
    this._getWeatherByIdUseCase,
    this._favoriteLocationWeatherUseCase,
    this._isFavoriteWeatherUseCase,
  );

  final weatherDetail = Rxn<WeatherDetailViewModel>();
  final isFavorited = false.obs;

  bool isLoadingWeather = false;
  bool isLoadingForecast = false;

  @override
  void onReady() {
    super.onReady();
    final locationId = (Get.arguments as LocationDetailArgument).id;
    _getWeatherByLocationId(locationId);
    _getStatusFavorite(locationId);
  }

  void updateFavorite() async {
    if (weatherDetail.value?.id == null) return;
    final id = weatherDetail.value!.id;
    _setFavorite(id, !isFavorited.value);
    isFavorited(!isFavorited.value);
    _favoriteManager.onUpdateFavorite();
  }

  Future<void> onRefresh() async {
    final locationId = (Get.arguments as LocationDetailArgument).id;
    _getWeatherByLocationId(locationId);
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

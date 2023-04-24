import 'package:get/get.dart';

import '../../../../domain/model/forecast_weather_model.dart';
import '../../../../domain/model/location_weather_model.dart';
import '../../../../domain/use_case/favorite_location_weather_use_case.dart';
import '../../../../domain/use_case/get_forecast_weathers_by_id_use_case.dart';
import '../../../../domain/use_case/get_weather_by_id_use_case.dart';
import '../../../../domain/use_case/is_favorite_weather_use_case.dart';
import '../views/location_detail_view.dart';

class LocationDetailController extends GetxController {
  final GetWeatherByIdUseCase _getWeatherByIdUseCase;
  final GetForecastWeathersByIdUseCase _getForecastWeathersByIdUseCase;
  final FavoriteLocationWeatherUseCase _favoriteLocationWeatherUseCase;
  final IsFavoriteWeatherUseCase _isFavoriteWeatherUseCase;

  LocationDetailController(
    this._getWeatherByIdUseCase,
    this._getForecastWeathersByIdUseCase,
    this._favoriteLocationWeatherUseCase,
    this._isFavoriteWeatherUseCase,
  );

  final isLoading = false.obs;
  final weatherDetail = Rxn<LocationWeatherModel>();
  final forecastWeathers = <ForecastWeatherModel>[].obs;
  final isFavorited = false.obs;

  bool isLoadingWeather = false;
  bool isLoadingForecast = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    final weatherId = (Get.arguments as LocationDetailArgument).weatherId;
    _getWeatherById(weatherId);
    _getForecastWeathersById(weatherId);
    _getStatusFavorite(weatherId);
  }

  updateFavorite() async {
    if (weatherDetail.value?.id == null) return;
    final id = weatherDetail.value!.id!;
    _setFavorite(id, !isFavorited.value);
    isFavorited(!isFavorited.value);
  }

  _getWeatherById(int weatherId) async {
    _isLoading(isLoadingWeather: true);
    try {
      var response = await _getWeatherByIdUseCase.invoke(weatherId);
      weatherDetail(response);
    } catch (e) {
      print("error");
    }
    _isLoading(isLoadingWeather: false);
  }

  _getForecastWeathersById(int weatherId) async {
    _isLoading(isLoadingForecast: true);
    try {
      var response = await _getForecastWeathersByIdUseCase.invoke(weatherId);
      forecastWeathers(response);
    } catch (e) {
      print("error");
    }
    _isLoading(isLoadingForecast: false);
  }

  _isLoading({bool? isLoadingWeather, bool? isLoadingForecast}) {
    if (isLoadingWeather != null) {
      this.isLoadingWeather = isLoadingWeather;
    }
    if (isLoadingForecast != null) {
      this.isLoadingForecast = isLoadingForecast;
    }
    isLoading(this.isLoadingWeather || this.isLoadingForecast);
  }

  _setFavorite(int weatherId, bool isFavorited) async {
    try {
      await _favoriteLocationWeatherUseCase.invoke(weatherId, isFavorited);
    } catch (e) {
      print("error");
    }
  }

  _getStatusFavorite(int weatherId) async {
    try {
      isFavorited(await _isFavoriteWeatherUseCase.invoke(weatherId));
    } catch (e) {
      print("error");
    }
  }
}

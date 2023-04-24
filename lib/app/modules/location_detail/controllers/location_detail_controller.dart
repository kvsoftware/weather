import 'package:get/get.dart';
import '../views/location_detail_view.dart';
import '../../../../domain/model/forecast_weather_model.dart';
import '../../../../domain/model/weather_detail_model.dart';

import '../../../../domain/use_case/get_forecast_weathers_by_id_use_case.dart';
import '../../../../domain/use_case/get_weather_by_id_use_case.dart';

class LocationDetailController extends GetxController {
  final GetWeatherByIdUseCase _getWeatherByIdUseCase;
  final GetForecastWeathersByIdUseCase _getForecastWeathersByIdUseCase;

  LocationDetailController(
    this._getWeatherByIdUseCase,
    this._getForecastWeathersByIdUseCase,
  );

  final isLoading = false.obs;
  final weatherDetail = Rxn<WeatherDetailModel>();
  final forecastWeathers = <ForecastWeatherModel>[].obs;

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
  }

  @override
  void onClose() {
    super.onClose();
  }

  _getWeatherById(int weatherId) async {
    try {
      isLoading(true);
      var response = await _getWeatherByIdUseCase.invoke(weatherId);
      weatherDetail(response);
      isLoading(false);
    } catch (e) {
      print("error");
    }
  }

  _getForecastWeathersById(int weatherId) async {
    try {
      isLoading(true);
      var response = await _getForecastWeathersByIdUseCase.invoke(weatherId);
      forecastWeathers(response);
      isLoading(false);
    } catch (e) {
      print("error");
    }
  }
}

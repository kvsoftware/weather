import 'package:get/get.dart';
import 'package:weather/app/modules/location_detail/views/location_detail_view.dart';
import 'package:weather/domain/model/weather_detail_model.dart';

import '../../../../domain/use_case/get_weather_by_id_use_case.dart';

class LocationDetailController extends GetxController {
  final GetWeatherByIdUseCase _getWeatherByIdUseCase;
  LocationDetailController(this._getWeatherByIdUseCase);

  final isLoading = false.obs;
  final weatherDetail = Rxn<WeatherDetailModel>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _getWeatherById((Get.arguments as LocationDetailArgument).weatherId);
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
}

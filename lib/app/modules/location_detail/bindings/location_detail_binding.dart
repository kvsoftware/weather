import 'package:get/get.dart';
import 'package:weather/domain/use_case/get_weather_by_id_use_case.dart';

import '../controllers/location_detail_controller.dart';

class LocationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetWeatherByIdUseCase(Get.find()));
    Get.lazyPut<LocationDetailController>(
      () => LocationDetailController(Get.find()),
    );
  }
}

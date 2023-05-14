import 'package:get/get.dart';

import '../../../../domain/use_case/favorite_location_weather_use_case.dart';
import '../../../../domain/use_case/is_favorite_weather_use_case.dart';
import '../../../domain/use_case/get_weather_by_location_id_use_case.dart';
import 'location_detail_controller.dart';

class LocationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetWeatherByIdUseCase(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => IsFavoriteWeatherUseCase(Get.find()));
    Get.lazyPut(() => FavoriteLocationWeatherUseCase(Get.find()));
    Get.lazyPut<LocationDetailController>(
      () => LocationDetailController(Get.find(), Get.find(), Get.find(), Get.find()),
    );
  }
}

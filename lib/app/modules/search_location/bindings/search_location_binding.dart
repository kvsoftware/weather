import 'package:get/get.dart';

import '../../../../domain/use_case/get_weathers_use_case.dart';
import '../controllers/search_location_controller.dart';

class SearchLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetWeathersUseCase(Get.find(), Get.find()));
    Get.lazyPut<SearchLocationController>(
        () => SearchLocationController(Get.find()));
  }
}
import 'package:get/get.dart';

import '../../../../domain/use_case/get_weathers_by_keyword_use_case.dart';
import 'search_location_controller.dart';

class SearchLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetWeathersByKeywordUseCase(Get.find(), Get.find(), Get.find()));
    Get.lazyPut<SearchLocationController>(() => SearchLocationController(Get.find()));
  }
}

import 'package:get/get.dart';

import '../../../domain/use_case/get_favorited_locations_use_case.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetFavoritedLocationsUseCase(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}

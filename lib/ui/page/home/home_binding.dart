import 'package:get/get.dart';
import 'map/map_controller.dart';

import '../../../domain/use_case/get_favorited_locations_use_case.dart';
import '../../../domain/use_case/get_weather_map_tile_use_case.dart';
import 'favorites/favorites_controller.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetFavoritedLocationsUseCase(Get.find(), Get.find()));
    Get.lazyPut(() => GetWeatherMapTileUseCase(Get.find()));
    Get.lazyPut<FavoritesController>(() => FavoritesController(Get.find()));
    Get.lazyPut<MapController>(() => MapController(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

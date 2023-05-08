import 'package:get/get.dart';

import '../../../domain/use_case/get_camera_position_use_case.dart';
import '../../../domain/use_case/get_favorited_locations_use_case.dart';
import '../../../domain/use_case/get_weather_map_layer_use_case.dart';
import '../../../domain/use_case/get_weather_map_tile_use_case.dart';
import '../../../domain/use_case/set_camera_position_use_case.dart';
import '../../../domain/use_case/set_weather_map_layer_use_case.dart';
import 'favorites/favorites_controller.dart';
import 'home_controller.dart';
import 'map/map_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetFavoritedLocationsUseCase(Get.find(), Get.find()));
    Get.lazyPut(() => GetCameraPositionUseCase(Get.find()));
    Get.lazyPut(() => SetCameraPositionUseCase(Get.find()));
    Get.lazyPut(() => GetWeatherMapTileUseCase(Get.find()));
    Get.lazyPut(() => GetWeatherMapLayerUseCase(Get.find()));
    Get.lazyPut(() => SetWeatherMapLayerUseCase(Get.find()));
    Get.lazyPut<FavoritesController>(() => FavoritesController(Get.find()));
    Get.lazyPut<MapController>(
      () => MapController(Get.find(), Get.find(), Get.find(), Get.find(), Get.find(), Get.find()),
    );
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

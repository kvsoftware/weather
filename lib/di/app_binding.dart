import 'package:get/get.dart';

import '../data/datasource/geo_data_source.dart';
import '../data/remote/geo_service.dart';
import '../data/remote/rest_client.dart';
import '../data/repository/geo_repository.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(getDio('https://api.openweathermap.org/'));
    Get.put(GeoService(Get.find()));
    Get.put(GeoDataSource(Get.find()));
    Get.put(GeoRepository(Get.find()));
   
  }
}

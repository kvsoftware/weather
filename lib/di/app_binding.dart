import 'package:get/get.dart';

import '../data/datasource/local/database/app_database.dart';
import '../data/datasource/local/weather_local_data_source.dart';
import '../data/datasource/remote/geo_data_source.dart';
import '../data/datasource/remote/rest/data_service.dart';
import '../data/datasource/remote/rest/geo_service.dart';
import '../data/datasource/remote/rest/rest_client.dart';
import '../data/datasource/remote/weather_remote_data_source.dart';
import '../data/repository/geo_repository.dart';
import '../data/repository/weather_repository.dart';

class AppBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync(
      () => $FloorAppDatabase.databaseBuilder('app_database.db').build(),
      permanent: true,
    );
    Get.put(getDio('https://api.openweathermap.org/'));
    Get.put(GeoService(Get.find()));
    Get.put(DataService(Get.find()));
    Get.put(GeoDataSource(Get.find()));
    Get.put(WeatherLocalDataSource(Get.find()));
    Get.put(WeatherRemoteDataSource(Get.find()));
    Get.put(GeoRepository(Get.find()));
    Get.put(WeatherRepository(Get.find(), Get.find()));
  }
}

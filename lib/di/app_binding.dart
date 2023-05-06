import 'package:get/get.dart';

import '../data/datasource/local/database/app_database.dart';
import '../data/datasource/local/favorite_local_data_source.dart';
import '../data/datasource/local/weather_local_data_source.dart';
import '../data/datasource/remote/geo_remote_data_source.dart';
import '../data/datasource/remote/map_remote_data_source.dart';
import '../data/datasource/remote/rest/data_service.dart';
import '../data/datasource/remote/rest/geo_service.dart';
import '../data/datasource/remote/rest/map_service.dart';
import '../data/datasource/remote/rest/rest_client.dart';
import '../data/datasource/remote/weather_remote_data_source.dart';
import '../data/repository/favorite_repository.dart';
import '../data/repository/geo_repository.dart';
import '../data/repository/map_repository.dart';
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
    Get.put(MapService(Get.find()));
    Get.put(GeoRemoteDataSource(Get.find()));
    Get.put(WeatherLocalDataSource(Get.find()));
    Get.put(WeatherRemoteDataSource(Get.find()));
    Get.put(FavoriteLocalDataSource(Get.find()));
    Get.put(MapRemoteDataSource(Get.find()));
    Get.put(FavoriteRepository(Get.find()));
    Get.put(GeoRepository(Get.find()));
    Get.put(WeatherRepository(Get.find(), Get.find()));
    Get.put(MapRepository(Get.find()));
  }
}

import 'package:get/get.dart';

import '../data/datasource/local/country_local_data_source.dart';
import '../data/datasource/local/database/database_module.dart';
import '../data/datasource/local/favorite_local_data_source.dart';
import '../data/datasource/local/location_local_data_source.dart';
import '../data/datasource/local/map_preference_local_data_source.dart';
import '../data/datasource/local/shared_pref/shared_pref_module.dart';
import '../data/datasource/local/weather_local_data_source.dart';
import '../data/datasource/remote/country_remote_data_source.dart';
import '../data/datasource/remote/location_remote_data_source.dart';
import '../data/datasource/remote/map_remote_data_source.dart';
import '../data/datasource/remote/rest/country_service.dart';
import '../data/datasource/remote/rest/data_service.dart';
import '../data/datasource/remote/rest/location_service.dart';
import '../data/datasource/remote/rest/map_service.dart';
import '../data/datasource/remote/rest/rest_api_module.dart';
import '../data/datasource/remote/weather_remote_data_source.dart';
import '../data/repository/country_repository.dart';
import '../data/repository/favorite_repository.dart';
import '../data/repository/location_repository.dart';
import '../data/repository/map_preference_repository.dart';
import '../data/repository/map_repository.dart';
import '../data/repository/weather_repository.dart';

class AppBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync(
      () => $FloorDatabaseModule.databaseBuilder('app_database.db').build(),
      permanent: true,
    );
    Get.put(getDio('https://api.openweathermap.org/'));
    Get.put(SharedPrefModule());
    Get.put(LocationService(Get.find()));
    Get.put(DataService(Get.find()));
    Get.put(MapService(Get.find()));
    Get.put(CountryService(Get.find()));
    Get.put(LocationLocalDataSource(Get.find()));
    Get.put(LocationRemoteDataSource(Get.find()));
    Get.put(LocationRepository(Get.find(), Get.find()));
    Get.put(WeatherLocalDataSource(Get.find()));
    Get.put(WeatherRemoteDataSource(Get.find()));
    Get.put(WeatherRepository(Get.find(), Get.find()));
    Get.put(FavoriteLocalDataSource(Get.find()));
    Get.put(FavoriteRepository(Get.find()));
    Get.put(MapPreferenceLocalDataSource(Get.find()));
    Get.put(MapPreferenceRepository(Get.find()));
    Get.put(MapRemoteDataSource(Get.find()));
    Get.put(MapRepository(Get.find()));
    Get.put(CountryLocalDataSource(Get.find()));
    Get.put(CountryRemoteDataSource(Get.find()));
    Get.put(CountryRepository(Get.find(), Get.find()));
  }
}

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/location_detail/bindings/location_detail_binding.dart';
import '../modules/location_detail/views/location_detail_view.dart';
import '../modules/search_location/bindings/search_location_binding.dart';
import '../modules/search_location/views/search_location_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_LOCATION,
      page: () => SearchLocationView(),
      binding: SearchLocationBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION_DETAIL,
      page: () => const LocationDetailView(),
      binding: LocationDetailBinding(),
    ),
  ];
}

import 'package:get/get.dart';

import '../page/home/home_binding.dart';
import '../page/home/home_view.dart';
import '../page/location_detail/location_detail_binding.dart';
import '../page/location_detail/location_detail_view.dart';
import '../page/search_location/search_location_binding.dart';
import '../page/search_location/search_location_view.dart';

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

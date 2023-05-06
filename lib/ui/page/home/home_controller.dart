import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../../domain/mapper/weather_view_model_mapper.dart';
import '../../../domain/use_case/get_favorited_locations_use_case.dart';
import '../../view_model/weather_view_model.dart';

class HomeController extends GetxController {
  final GetFavoritedLocationsUseCase _getFavoritedLocationsUseCase;
  HomeController(this._getFavoritedLocationsUseCase);

  final isLoading = false.obs;
  final isOffline = false.obs;
  final locations = <WeatherViewModel>[].obs;
  late StreamSubscription subscription;

  @override
  void onInit() {
    super.onInit();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isOffline(result == ConnectivityResult.none);
    });
  }

  @override
  void onReady() {
    super.onReady();
    _getFavoritedWeathers();
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }

  Future<void> onRefresh() async {
    _getFavoritedWeathers();
  }

  void _getFavoritedWeathers() async {
    isLoading(true);
    try {
      var weatherViewModels =
          (await _getFavoritedLocationsUseCase.invoke()).map((e) => e.toWeatherViewModel()).toList();
      locations(weatherViewModels);
    } catch (e) {
      print("error");
    }
    isLoading(false);
  }
}

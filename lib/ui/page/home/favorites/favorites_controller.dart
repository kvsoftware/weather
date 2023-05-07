import 'dart:async';

import 'package:get/get.dart';

import '../../../../domain/use_case/get_favorited_locations_use_case.dart';
import '../../../base_controller.dart';
import '../../../mapper/weather_view_model_mapper.dart';
import '../../../view_model/weather_view_model.dart';

class FavoritesController extends BaseController {
  final GetFavoritedLocationsUseCase _getFavoritedLocationsUseCase;
  FavoritesController(this._getFavoritedLocationsUseCase);

  final locations = <WeatherViewModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getFavoritedWeathers();
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

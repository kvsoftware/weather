import 'dart:async';

import 'package:get/get.dart';

import '../../../../domain/manager/favorite_manager.dart';
import '../../../../domain/use_case/get_favorited_locations_use_case.dart';
import '../../../base_controller.dart';
import '../../../mapper/weather_view_model_mapper.dart';
import '../../../view_model/weather_view_model.dart';

class FavoritesController extends BaseController with FavoriteListener {
  final FavoriteManager _favoriteManager;
  final GetFavoritedLocationsUseCase _getFavoritedLocationsUseCase;

  FavoritesController(this._favoriteManager, this._getFavoritedLocationsUseCase);

  final locations = <WeatherViewModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _favoriteManager.addListenerInFavoritePage(this);
  }

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
      // Do nothing
    }
    isLoading(false);
  }

  @override
  void onFavoriteUpdated() {
    _getFavoritedWeathers();
  }
}

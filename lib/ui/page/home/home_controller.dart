import 'package:get/get.dart';

import '../../../domain/mapper/weather_view_model_mapper.dart';
import '../../../domain/use_case/get_favorited_locations_use_case.dart';
import '../../view_model/weather_view_model.dart';

class HomeController extends GetxController {
  final GetFavoritedLocationsUseCase _getFavoritedLocationsUseCase;
  HomeController(this._getFavoritedLocationsUseCase);

  final isLoading = false.obs;
  final locations = <WeatherViewModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _getFavoritedWeathers();
  }

  @override
  void onClose() {
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

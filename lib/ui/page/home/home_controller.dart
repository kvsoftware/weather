import 'package:get/get.dart';

import '../../../domain/use_case/get_favorited_locations_use_case.dart';

class HomeController extends GetxController {
  final GetFavoritedLocationsUseCase _getFavoritedLocationsUseCase;
  HomeController(this._getFavoritedLocationsUseCase);

  final isLoading = false.obs;

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

  _getFavoritedWeathers() async {
    try {
      final response = await _getFavoritedLocationsUseCase.invoke();
      print('response : ${response.length}');
    } catch (e) {
      print("error");
    }
  }
}

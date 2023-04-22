import 'package:get/get.dart';

import '../../../../domain/model/weather_model.dart';
import '../../../../domain/use_case/get_weathers_use_case.dart';

class SearchLocationController extends GetxController {
  final GetWeathersUseCase _getWeathersUseCase;
  SearchLocationController(this._getWeathersUseCase);

  final isLoading = false.obs;
  final locations = <WeatherModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onTextChanged(String text) {
    _getLocationsByQuery(text);
  }

  _getLocationsByQuery(String query) async {
    try {
      var response = await _getWeathersUseCase.invoke(
          '0d3300d38b4b510e4b2400e838523d69', query);
      locations(response);
    } catch (e) {
      print("test");
    }
  }
}

import 'dart:async';

import 'package:get/get.dart';

import '../../../../domain/model/weather_model.dart';
import '../../../../domain/use_case/get_weathers_use_case.dart';

class SearchLocationController extends GetxController {
  final GetWeathersUseCase _getWeathersUseCase;
  SearchLocationController(this._getWeathersUseCase);

  final isLoading = false.obs;
  final locations = <WeatherModel>[].obs;

  Timer? _timer;
  final _delayInSeconds = 2;

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
    _timer?.cancel();
  }

  onTextChanged(String text) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: _delayInSeconds), () {
      _getLocationsByQuery(text);
    });
  }

  _getLocationsByQuery(String query) async {
    try {
      isLoading(true);
      var response = await _getWeathersUseCase.invoke(query);
      locations(response);
      isLoading(false);
    } catch (e) {
      print("error");
    }
  }
}

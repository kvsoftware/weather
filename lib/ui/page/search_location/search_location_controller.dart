import 'dart:async';

import 'package:get/get.dart';

import '../../../domain/mapper/weather_view_model_mapper.dart';
import '../../../domain/use_case/get_weathers_by_keyword_use_case.dart';
import '../../view_model/weather_view_model.dart';

class SearchLocationController extends GetxController {
  final GetWeathersByKeywordUseCase _getWeathersByKeywordUseCase;
  SearchLocationController(this._getWeathersByKeywordUseCase);

  final isLoading = false.obs;
  final locations = <WeatherViewModel>[].obs;

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
      var weatherViewModels = (await _getWeathersByKeywordUseCase.invoke(query))
          .map((e) => e.toWeatherViewModel())
          .toList();
      locations(weatherViewModels);
      isLoading(false);
    } catch (e) {
      print("error");
    }
  }
}

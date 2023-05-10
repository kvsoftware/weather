import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../../domain/use_case/get_weathers_by_keyword_use_case.dart';
import '../../mapper/weather_view_model_mapper.dart';
import '../../view_model/weather_view_model.dart';

class SearchLocationController extends GetxController {
  final GetWeathersByKeywordUseCase _getWeathersByKeywordUseCase;
  SearchLocationController(this._getWeathersByKeywordUseCase);

  final isLoading = false.obs;
  final isOffline = false.obs;
  final locations = <WeatherViewModel>[].obs;

  Timer? _timer;
  final _delayInSeconds = 1;

  late StreamSubscription subscription;

  @override
  void onInit() {
    super.onInit();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isOffline(result == ConnectivityResult.none);
    });
  }

  @override
  void onClose() {
    subscription.cancel();
    _timer?.cancel();
    super.onClose();
  }

  void onTextChanged(String text) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: _delayInSeconds), () {
      _getLocationsByQuery(text);
    });
  }

  void _getLocationsByQuery(String query) async {
    isLoading(true);
    try {
      var weatherViewModels =
          (await _getWeathersByKeywordUseCase.invoke(query)).map((e) => e.toWeatherViewModel()).toList();
      locations(weatherViewModels);
    } catch (e) {
      // Do nothing
    }
    isLoading(false);
  }
}

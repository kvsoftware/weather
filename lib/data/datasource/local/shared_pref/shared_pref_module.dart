import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/camera_position_model.dart';

class SharedPrefModule {
  static const String keyCameraPosition = 'camera_position';
  static const String keyWeatherMapLayer = 'weather_map_layer';

  Future<CameraPositionModel?> getCameraPosition() async {
    final prefs = await SharedPreferences.getInstance();
    String? cameraPositionModel = prefs.getString(keyCameraPosition);
    if (cameraPositionModel == null) {
      return null;
    }
    return CameraPositionModel.fromJson(json.decode(cameraPositionModel));
  }

  Future<void> setCameraPosition(CameraPositionModel? cameraPositionModel) async {
    final prefs = await SharedPreferences.getInstance();
    if (cameraPositionModel == null) {
      prefs.remove(keyCameraPosition);
    } else {
      await prefs.setString(keyCameraPosition, json.encode(cameraPositionModel));
    }
  }

  Future<String?> getWeatherMapLayer() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyWeatherMapLayer);
  }

  Future<void> setWeatherMapLayer(String? weatherMapLayer) async {
    final prefs = await SharedPreferences.getInstance();
    if (weatherMapLayer == null) {
      prefs.remove(keyWeatherMapLayer);
    } else {
      await prefs.setString(keyWeatherMapLayer, weatherMapLayer);
    }
  }
}

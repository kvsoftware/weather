import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/camera_position_model.dart';

class SharedPrefModule {
  static const String keyCameraPosition = 'camera_position';

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
}

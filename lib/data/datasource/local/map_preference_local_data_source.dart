import 'model/camera_position_model.dart';
import 'shared_pref/shared_pref_module.dart';

class MapPreferenceLocalDataSource {
  final SharedPrefModule _sharedPrefModule;

  MapPreferenceLocalDataSource(this._sharedPrefModule);

  Future<CameraPositionModel?> getCameraPosition() {
    return _sharedPrefModule.getCameraPosition();
  }

  Future<void> setCameraPosition(CameraPositionModel? cameraPositionModel) {
    return _sharedPrefModule.setCameraPosition(cameraPositionModel);
  }

  Future<String?> getWeatherMapLayer() {
    return _sharedPrefModule.getWeatherMapLayer();
  }

  Future<void> setWeatherMapLayer(String? weatherMapLayer) {
    return _sharedPrefModule.setWeatherMapLayer(weatherMapLayer);
  }
}

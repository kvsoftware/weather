import 'model/camera_position_model.dart';
import 'shared_pref/shared_pref_module.dart';

class CameraPositionLocalDataSource {
  final SharedPrefModule _sharedPrefModule;

  CameraPositionLocalDataSource(this._sharedPrefModule);

  Future<CameraPositionModel?> getCameraPosition() {
    return _sharedPrefModule.getCameraPosition();
  }

  Future<void> setCameraPosition(CameraPositionModel? cameraPositionModel) {
    return _sharedPrefModule.setCameraPosition(cameraPositionModel);
  }
}

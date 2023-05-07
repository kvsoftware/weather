import '../../data/repository/camera_position_repository.dart';
import '../entity/camera_position_entity.dart';

class SetCameraPositionUseCase {
  final CameraPositionRepository _cameraPositionRepository;

  SetCameraPositionUseCase(this._cameraPositionRepository);

  Future<void> invoke(double latitude, double longitude, double zoom) async {
    return await _cameraPositionRepository.setCameraPosition(
      CameraPositionEntity(
        latitude: latitude,
        longitude: longitude,
        zoom: zoom,
      ),
    );
  }
}

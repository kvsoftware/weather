import '../../data/repository/camera_position_repository.dart';
import '../entity/camera_position_entity.dart';

class GetCameraPositionUseCase {
  final CameraPositionRepository _cameraPositionRepository;

  GetCameraPositionUseCase(this._cameraPositionRepository);

  Future<CameraPositionEntity?> invoke() async {
    return await _cameraPositionRepository.getCameraPosition();
  }
}

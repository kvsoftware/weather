import '../../data/repository/map_preference_repository.dart';
import '../entity/camera_position_entity.dart';

class GetCameraPositionUseCase {
  final MapPreferenceRepository _mapPreferenceRepository;

  GetCameraPositionUseCase(this._mapPreferenceRepository);

  Future<CameraPositionEntity?> invoke() async {
    return await _mapPreferenceRepository.getCameraPosition();
  }
}

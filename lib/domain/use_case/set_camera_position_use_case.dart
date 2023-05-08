import '../../data/repository/map_preference_repository.dart';
import '../entity/camera_position_entity.dart';

class SetCameraPositionUseCase {
  final MapPreferenceRepository _mapPreferenceRepository;
  SetCameraPositionUseCase(this._mapPreferenceRepository);

  Future<void> invoke(double latitude, double longitude, double zoom) async {
    return await _mapPreferenceRepository.setCameraPosition(
      CameraPositionEntity(
        latitude: latitude,
        longitude: longitude,
        zoom: zoom,
      ),
    );
  }
}

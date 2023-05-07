import '../../domain/entity/camera_position_entity.dart';
import '../datasource/local/camera_position_data_source.dart';
import '../datasource/local/model/camera_position_model.dart';

class CameraPositionRepository {
  final CameraPositionLocalDataSource _cameraPositionLocalDataSource;
  CameraPositionRepository(this._cameraPositionLocalDataSource);

  Future<CameraPositionEntity?> getCameraPosition() async {
    final cameraPositionModel = await _cameraPositionLocalDataSource.getCameraPosition();
    if (cameraPositionModel == null) return null;
    return CameraPositionEntity(
      latitude: cameraPositionModel.latitude,
      longitude: cameraPositionModel.longitude,
      zoom: cameraPositionModel.zoom,
    );
  }

  Future<void> setCameraPosition(CameraPositionEntity? cameraPositionEntity) {
    if (cameraPositionEntity == null) return Future.value(null);
    final cameraPositionModel = CameraPositionModel(
      latitude: cameraPositionEntity.latitude,
      longitude: cameraPositionEntity.longitude,
      zoom: cameraPositionEntity.zoom,
    );
    return _cameraPositionLocalDataSource.setCameraPosition(cameraPositionModel);
  }
}

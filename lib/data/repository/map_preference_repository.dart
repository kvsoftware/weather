import '../../domain/entity/camera_position_entity.dart';
import '../datasource/local/map_preference_local_data_source.dart';
import '../datasource/local/model/camera_position_model.dart';

class MapPreferenceRepository {
  final MapPreferenceLocalDataSource _mapPreferenceLocalDataSource;
  MapPreferenceRepository(this._mapPreferenceLocalDataSource);

  Future<CameraPositionEntity?> getCameraPosition() async {
    final cameraPositionModel = await _mapPreferenceLocalDataSource.getCameraPosition();
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
    return _mapPreferenceLocalDataSource.setCameraPosition(cameraPositionModel);
  }

  Future<String?> getWeatherMapLayer() async {
    final weatherMapLayer = await _mapPreferenceLocalDataSource.getWeatherMapLayer();
    return weatherMapLayer;
  }

  Future<void> setWeatherMapLayer(String? weatherMapLayer) {
    if (weatherMapLayer == null) return Future.value(null);
    return _mapPreferenceLocalDataSource.setWeatherMapLayer(weatherMapLayer);
  }
}

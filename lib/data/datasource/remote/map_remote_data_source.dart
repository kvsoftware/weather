import 'rest/map_service.dart';

class MapRemoteDataSource {
  final MapService _mapService;
  MapRemoteDataSource(this._mapService);

  Future<List<int>> getWeatherMapTile({
    required String appId,
    required String mapType,
    required int x,
    required int y,
    required int zoom,
  }) {
    return _mapService.getWeatherMapTile(appId: appId, mapType: mapType, x: x, y: y, zoom: zoom);
  }
}

import 'dart:typed_data';

import '../datasource/remote/map_remote_data_source.dart';

class MapRepository {
  final MapRemoteDataSource _mapRemoteDataSource;

  MapRepository(this._mapRemoteDataSource);

  Future<Uint8List> getWeatherMapTile({
    required String appId,
    required String mapType,
    required int x,
    required int y,
    required int zoom,
  }) async {
    final response = await _mapRemoteDataSource.getWeatherMapTile(
      appId: appId,
      mapType: mapType,
      x: x,
      y: y,
      zoom: zoom,
    );
    return Uint8List.fromList(response);
  }
}

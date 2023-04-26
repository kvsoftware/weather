import '../../domain/entity/location_entity.dart';
import '../../domain/entity/weather_entity.dart';
import '../mapper/location_model_mapper.dart';

import '../datasource/remote/geo_remote_data_source.dart';
import '../datasource/remote/model/location_model.dart';

class GeoRepository {
  final GeoRemoteDataSource _geoDataSource;
  GeoRepository(this._geoDataSource);

  Future<List<LocationEntity>> getLocations(String appId, String q,
      {int? limit}) async {
    try {
      final locationModel = await _geoDataSource.getLocations(
        appId,
        q,
        limit: limit,
      );
      return locationModel.map((e) => e.toLocationEntity()).toList();
    } catch (e) {
      throw Exception('Connection failed');
    }
  }
}

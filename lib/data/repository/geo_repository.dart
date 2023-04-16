import '../datasource/geo_data_source.dart';
import '../entity/location_entity.dart';

class GeoRepository {
  final GeoDataSource _geoDataSource;
  GeoRepository(this._geoDataSource);

  Future<List<LocationEntity>> getLocations(String appId, String q,
      {String? limit}) {
    try {
      return _geoDataSource.getLocations(appId, q, limit: limit);
    } catch (e) {
      throw Exception('Connection failed');
    }
  }
}

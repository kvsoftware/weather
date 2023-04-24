import '../datasource/remote/geo_data_source.dart';
import '../datasource/remote/model/location_model.dart';

class GeoRepository {
  final GeoDataSource _geoDataSource;
  GeoRepository(this._geoDataSource);

  Future<List<LocationModel>> getLocations(String appId, String q,
      {int? limit}) {
    try {
      return _geoDataSource.getLocations(appId, q, limit: limit);
    } catch (e) {
      throw Exception('Connection failed');
    }
  }
}

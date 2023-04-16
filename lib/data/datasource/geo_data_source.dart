import '../entity/location_entity.dart';
import '../remote/geo_service.dart';

class GeoDataSource {
  final GeoService _geoService;

  GeoDataSource(this._geoService);

  Future<List<LocationEntity>> getLocations(String appId, String q,
      {String? limit}) {
    return _geoService.getLocations(appId, q, limit: limit);
  }
}

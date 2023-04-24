import 'model/location_model.dart';
import 'rest/geo_service.dart';

class GeoDataSource {
  final GeoService _geoService;

  GeoDataSource(this._geoService);

  Future<List<LocationModel>> getLocations(String appId, String q,
      {int? limit}) {
    return _geoService.getLocations(appId, q, limit: limit);
  }
}

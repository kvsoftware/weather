import 'model/location_api_model.dart';
import 'rest/geo_service.dart';

class GeoRemoteDataSource {
  final GeoService _geoService;

  GeoRemoteDataSource(this._geoService);

  Future<List<LocationApiModel>> getLocations(String appId, String q, {int? limit}) {
    return _geoService.getLocations(appId, q, limit: limit);
  }
}

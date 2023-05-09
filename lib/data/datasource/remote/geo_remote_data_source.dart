import 'model/location_api_model.dart';
import 'rest/geo_service.dart';

class GeoRemoteDataSource {
  final GeoService _geoService;

  GeoRemoteDataSource(this._geoService);

  Future<List<LocationApiModel>> getLocations({required String apiKey, required String q, int? limit}) {
    return _geoService.getLocations(apiKey: apiKey, q: q, limit: limit);
  }
}

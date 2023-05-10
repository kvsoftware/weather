import 'model/location_api_model.dart';
import 'rest/location_service.dart';

class LocationRemoteDataSource {
  final LocationService _locationService;

  LocationRemoteDataSource(this._locationService);

  Future<List<LocationApiModel>> getLocations({required String apiKey, required String q, int? limit}) {
    return _locationService.getLocations(apiKey: apiKey, q: q, limit: limit);
  }
}

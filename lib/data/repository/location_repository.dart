import '../../domain/entity/location_entity.dart';
import '../datasource/local/location_local_data_source.dart';
import '../datasource/remote/location_remote_data_source.dart';
import '../mapper/location_model_mapper.dart';

class LocationRepository {
  final LocationLocalDataSource _locationLocalDataSource;
  final LocationRemoteDataSource _locationRemoteDataSource;

  LocationRepository(this._locationLocalDataSource, this._locationRemoteDataSource);

  Future<List<LocationEntity>> getLocations({required String apiKey, required String q, int? limit}) async {
    try {
      final locationModels = await _locationRemoteDataSource.getLocations(apiKey: apiKey, q: q, limit: limit);
      for (var locationModel in locationModels) {
        _locationLocalDataSource.insertLocation(locationModel.toLocationDbModel());
      }
    } catch (e) {
      // Do nothing
    }
    final locationDbModels = await _locationLocalDataSource.getLocationsByName(q);
    return locationDbModels.map((e) => e.toLocationEntity()).toList();
  }

  Future<LocationEntity?> getLocationById({required String id}) async {
    try {
      final locationModel = await _locationLocalDataSource.getLocationById(id);
      return locationModel?.toLocationEntity();
    } catch (e) {
      throw Exception('Connection failed');
    }
  }
}

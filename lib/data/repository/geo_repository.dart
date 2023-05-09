import '../../domain/entity/location_entity.dart';
import '../datasource/remote/geo_remote_data_source.dart';
import '../mapper/location_model_mapper.dart';

class GeoRepository {
  final GeoRemoteDataSource _geoDataSource;
  GeoRepository(this._geoDataSource);

  Future<List<LocationEntity>> getLocations({required String apiKey, required String q, int? limit}) async {
    try {
      final locationModel = await _geoDataSource.getLocations(apiKey: apiKey, q: q, limit: limit);
      return locationModel.map((e) => e.toLocationEntity()).toList();
    } catch (e) {
      throw Exception('Connection failed');
    }
  }
}

import '../../data/repository/geo_repository.dart';
import '../mapper/location_model_mapper.dart';
import '../model/location_model.dart';

class GetLocationsUseCase {
  final GeoRepository _geoRepository;
  GetLocationsUseCase(this._geoRepository);

  Future<List<LocationModel>> invoke(String appId, String q,
      {String? limit}) async {
    return _geoRepository
        .getLocations(appId, q)
        .then((value) => value.map((e) => e.toLocationModel()).toList());
  }
}

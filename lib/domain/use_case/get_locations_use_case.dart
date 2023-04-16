import '../../data/repository/data_repository.dart';

import '../../data/repository/geo_repository.dart';
import '../mapper/location_model_mapper.dart';
import '../model/location_model.dart';

class GetLocationsUseCase {
  final GeoRepository _geoRepository;
  final DataRepository _dataRepository;
  GetLocationsUseCase(this._geoRepository, this._dataRepository);

  Future<List<LocationModel>> invoke(String appId, String q,
      {String? limit}) async {
    var locationEntities = await _geoRepository.getLocations(appId, q);
    var locationModels = <LocationModel>[];
    for (var locationEntity in locationEntities) {
      var data = await _dataRepository.getWeatherData(appId, locationEntity.lat!, locationEntity.lon!);
      var test = locationEntity.toLocationModel(data.main!.temp!);
      locationModels.add(test);
    }
    return locationModels;
  }
}

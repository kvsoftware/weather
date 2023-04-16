import '../../data/entity/location_entity.dart';
import '../model/location_model.dart';

extension LocationModelParsing on LocationEntity {
  LocationModel toLocationModel(double? temp) {
    return LocationModel(
      name: name,
      lat: lat,
      lon: lon,
      country: country,
      state: state,
      temp: temp,
    );
  }
}

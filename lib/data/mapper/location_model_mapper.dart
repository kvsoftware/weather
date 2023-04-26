import '../datasource/remote/model/location_model.dart';
import '../../domain/entity/location_entity.dart';

extension LocationModelMapping on LocationModel {
  LocationEntity toLocationEntity() {
    return LocationEntity(
      name: name,
      lat: lat,
      lon: lon,
      country: country,
      state: state,
    );
  }
}

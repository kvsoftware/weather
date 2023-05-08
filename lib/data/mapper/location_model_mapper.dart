import '../../domain/entity/location_entity.dart';
import '../datasource/remote/model/location_api_model.dart';

extension LocationApiModelMapping on LocationApiModel {
  LocationEntity toLocationEntity() {
    return LocationEntity(name: name, lat: lat, lon: lon, country: country, state: state);
  }
}

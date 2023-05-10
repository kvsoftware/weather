import '../../domain/entity/location_entity.dart';
import '../datasource/local/model/location_db_model.dart';
import '../datasource/remote/model/location_api_model.dart';

extension LocationApiModelMapping on LocationApiModel {
  LocationEntity toLocationEntity() {
    return LocationEntity(name: name ?? '', lat: lat ?? 0, lon: lon ?? 0, country: country ?? '', state: state ?? '');
  }

  LocationDbModel toLocationDbModel() {
    return LocationDbModel(
        id: '${lat}_$lon',
        name: name ?? '',
        lat: lat ?? 0,
        lon: lon ?? 0,
        country: country ?? '',
        state: state ?? '');
  }
}

extension LocationDbModelMapping on LocationDbModel {
  LocationEntity toLocationEntity() {
    return LocationEntity(name: name, lat: lat, lon: lon, country: country, state: state);
  }
}

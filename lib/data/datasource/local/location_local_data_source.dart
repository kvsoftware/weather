import 'database/database_module.dart';
import 'model/location_db_model.dart';

class LocationLocalDataSource {
  final DatabaseModule _databaseModule;

  LocationLocalDataSource(this._databaseModule);

  Future<LocationDbModel?> getLocationById(String id) {
    return _databaseModule.locationDao.getLocationById(id);
  }

  Future<LocationDbModel?> getLocationByLatLng(double latitude, double longitude) {
    return _databaseModule.locationDao.getLocationByLatLng(latitude, longitude);
  }

  Future<List<LocationDbModel>> getLocationsByName(String name) {
    return _databaseModule.locationDao.getLocationsByName(name);
  }

  Future<void> insertLocation(LocationDbModel locationDbModel) {
    return _databaseModule.locationDao.insertLocation(locationDbModel);
  }

  Future<void> deleteFavorite(LocationDbModel locationDbModel) {
    return _databaseModule.locationDao.deleteLocation(locationDbModel);
  }
}

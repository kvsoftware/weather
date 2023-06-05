import 'package:floor/floor.dart';

import '../model/location_db_model.dart';
import 'database_module.dart';

const String columnId = 'id';
const String columnName = 'name';
const String columnLatitude = 'latitude';
const String columnLongitude = 'longitude';

@dao
abstract class LocationDao {
  @Query('SELECT * FROM $locationTable WHERE $columnId = :id')
  Future<LocationDbModel?> getLocationById(String id);

  @Query('SELECT * FROM $locationTable WHERE $columnLatitude = :latitude AND $columnLongitude = :longitude')
  Future<LocationDbModel?> getLocationByLatLng(double latitude, double longitude);

  @Query('SELECT * FROM $locationTable WHERE $columnName LIKE :name')
  Future<List<LocationDbModel>> getLocationsByName(String name);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertLocation(LocationDbModel locationDbModel);

  @delete
  Future<void> deleteLocation(LocationDbModel locationDbModel);
}

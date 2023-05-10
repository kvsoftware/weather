import 'package:floor/floor.dart';

import '../model/location_db_model.dart';

@dao
abstract class LocationDao {
  @Query('SELECT * FROM location WHERE id = :id')
  Future<LocationDbModel?> getLocationById(String id);

  @Query('SELECT * FROM location WHERE latitude = :latitude AND longitude = :longitude')
  Future<LocationDbModel?> getLocationByLatLng(double latitude, double longitude);

  @Query('SELECT * FROM location WHERE name LIKE :name')
  Future<List<LocationDbModel>> getLocationsByName(String name);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertLocation(LocationDbModel locationDbModel);

  @delete
  Future<void> deleteLocation(LocationDbModel locationDbModel);
}

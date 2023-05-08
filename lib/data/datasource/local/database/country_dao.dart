import 'package:floor/floor.dart';

import '../model/country_db_model.dart';

@dao
abstract class CountryDao {
  @Query('SELECT * FROM country WHERE code = :code')
  Future<CountryDbModel?> getCountryByCode(String code);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCountry(CountryDbModel favoriteDbModel);

  @delete
  Future<void> deleteCountry(CountryDbModel favoriteDbModel);
}

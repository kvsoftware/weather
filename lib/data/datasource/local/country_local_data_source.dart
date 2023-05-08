import 'database/database_module.dart';
import 'model/country_db_model.dart';

class CountryLocalDataSource {
  final DatabaseModule _databaseModule;

  CountryLocalDataSource(this._databaseModule);

  Future<CountryDbModel?> getCountryByCode({required String code}) {
    return _databaseModule.countryDao.getCountryByCode(code);
  }

  Future<void> insertCountry(CountryDbModel countryDbModel) {
    return _databaseModule.countryDao.insertCountry(countryDbModel);
  }
}

import '../../domain/entity/country_entity.dart';
import '../datasource/local/country_local_data_source.dart';
import '../datasource/remote/country_remote_data_source.dart';
import '../mapper/country_model_mapper.dart';

class CountryRepository {
  final CountryLocalDataSource _countryLocalDataSource;
  final CountryRemoteDataSource _countryRemoteDataSource;

  CountryRepository(this._countryLocalDataSource, this._countryRemoteDataSource);

  Future<CountryEntity?> getCountryByCode({required String code}) async {
    try {
      final response = await _countryRemoteDataSource.getCountryByCode(code: code);
      _countryLocalDataSource.insertCountry(response[0].toCountryDbModel(code));
    } catch (e) {
      // Do nothing
    }

    final countryDbModel = await _countryLocalDataSource.getCountryByCode(code: code);
    return countryDbModel?.toCountryEntity();
  }
}

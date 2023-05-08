import 'model/country_api_model.dart';
import 'rest/country_service.dart';

class CountryRemoteDataSource {
  final CountryService _countryService;

  CountryRemoteDataSource(this._countryService);

  Future<List<CountryApiModel>> getCountryByCode({required String code}) {
    return _countryService.getCountryByCode(code: code);
  }
}

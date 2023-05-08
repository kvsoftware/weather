import '../../domain/entity/country_entity.dart';
import '../datasource/local/model/country_db_model.dart';
import '../datasource/remote/model/country_api_model.dart';

extension CountryDbModelMapping on CountryDbModel {
  CountryEntity toCountryEntity() {
    return CountryEntity(
      name: name,
    );
  }
}

extension CountryApiModelMapping on CountryApiModel {
  CountryDbModel toCountryDbModel(String code) {
    return CountryDbModel(
      code: code,
      name: name?.common ?? '',
    );
  }
}

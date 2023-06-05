import 'package:floor/floor.dart';

import '../database/database_module.dart';

@Entity(tableName: countryTable)
class CountryDbModel {
  @primaryKey
  final String code;
  final String name;

  CountryDbModel({required this.code, required this.name});
}

import 'package:floor/floor.dart';

@Entity(tableName: 'country')
class CountryDbModel {
  @primaryKey
  final String code;
  final String name;

  CountryDbModel({required this.code, required this.name});
}

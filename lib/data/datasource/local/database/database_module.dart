import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../model/country_db_model.dart';
import '../model/favorite_db_model.dart';
import '../model/location_db_model.dart';
import '../model/weather_db_model.dart';
import 'country_dao.dart';
import 'favorite_dao.dart';
import 'location_dao.dart';
import 'weather_dao.dart';

part 'database_module.g.dart';

@Database(version: 1, entities: [LocationDbModel, WeatherDbModel, CountryDbModel, FavoriteDbModel])
abstract class DatabaseModule extends FloorDatabase {
  LocationDao get locationDao;
  WeatherDao get weatherDao;
  CountryDao get countryDao;
  FavoriteDao get favoriteDao;
}

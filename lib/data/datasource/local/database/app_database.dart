import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../model/favorite_db_model.dart';
import '../model/weather_db_model.dart';
import 'favorite_dao.dart';
import 'weather_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [WeatherDbModel, FavoriteDbModel])
abstract class AppDatabase extends FloorDatabase {
  WeatherDao get weatherDao;
  FavoriteDao get favoriteDao;
}

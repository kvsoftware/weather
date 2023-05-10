// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_module.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDatabaseModule {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseModuleBuilder databaseBuilder(String name) =>
      _$DatabaseModuleBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseModuleBuilder inMemoryDatabaseBuilder() =>
      _$DatabaseModuleBuilder(null);
}

class _$DatabaseModuleBuilder {
  _$DatabaseModuleBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DatabaseModuleBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DatabaseModuleBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DatabaseModule> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DatabaseModule();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DatabaseModule extends DatabaseModule {
  _$DatabaseModule([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LocationDao? _locationDaoInstance;

  WeatherDao? _weatherDaoInstance;

  CountryDao? _countryDaoInstance;

  FavoriteDao? _favoriteDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `location` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `lat` REAL NOT NULL, `lon` REAL NOT NULL, `country` TEXT NOT NULL, `state` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `weather` (`id` TEXT NOT NULL, `countryCode` TEXT NOT NULL, `lat` REAL NOT NULL, `lon` REAL NOT NULL, `temp` REAL NOT NULL, `tempMin` REAL NOT NULL, `tempMax` REAL NOT NULL, `weatherCode` INTEGER NOT NULL, `weatherIcon` TEXT NOT NULL, `weatherCondition` TEXT NOT NULL, `dt` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `country` (`code` TEXT NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`code`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `favorite` (`locationId` TEXT NOT NULL, PRIMARY KEY (`locationId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LocationDao get locationDao {
    return _locationDaoInstance ??= _$LocationDao(database, changeListener);
  }

  @override
  WeatherDao get weatherDao {
    return _weatherDaoInstance ??= _$WeatherDao(database, changeListener);
  }

  @override
  CountryDao get countryDao {
    return _countryDaoInstance ??= _$CountryDao(database, changeListener);
  }

  @override
  FavoriteDao get favoriteDao {
    return _favoriteDaoInstance ??= _$FavoriteDao(database, changeListener);
  }
}

class _$LocationDao extends LocationDao {
  _$LocationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _locationDbModelInsertionAdapter = InsertionAdapter(
            database,
            'location',
            (LocationDbModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'lat': item.lat,
                  'lon': item.lon,
                  'country': item.country,
                  'state': item.state
                }),
        _locationDbModelDeletionAdapter = DeletionAdapter(
            database,
            'location',
            ['id'],
            (LocationDbModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'lat': item.lat,
                  'lon': item.lon,
                  'country': item.country,
                  'state': item.state
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LocationDbModel> _locationDbModelInsertionAdapter;

  final DeletionAdapter<LocationDbModel> _locationDbModelDeletionAdapter;

  @override
  Future<LocationDbModel?> getLocationById(String id) async {
    return _queryAdapter.query('SELECT * FROM location WHERE id = ?1',
        mapper: (Map<String, Object?> row) => LocationDbModel(
            id: row['id'] as String,
            name: row['name'] as String,
            lat: row['lat'] as double,
            lon: row['lon'] as double,
            country: row['country'] as String,
            state: row['state'] as String),
        arguments: [id]);
  }

  @override
  Future<LocationDbModel?> getLocationByLatLng(
    double latitude,
    double longitude,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM location WHERE latitude = ?1 AND longitude = ?2',
        mapper: (Map<String, Object?> row) => LocationDbModel(
            id: row['id'] as String,
            name: row['name'] as String,
            lat: row['lat'] as double,
            lon: row['lon'] as double,
            country: row['country'] as String,
            state: row['state'] as String),
        arguments: [latitude, longitude]);
  }

  @override
  Future<List<LocationDbModel>> getLocationsByName(String name) async {
    return _queryAdapter.queryList('SELECT * FROM location WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) => LocationDbModel(
            id: row['id'] as String,
            name: row['name'] as String,
            lat: row['lat'] as double,
            lon: row['lon'] as double,
            country: row['country'] as String,
            state: row['state'] as String),
        arguments: [name]);
  }

  @override
  Future<void> insertLocation(LocationDbModel locationDbModel) async {
    await _locationDbModelInsertionAdapter.insert(
        locationDbModel, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteLocation(LocationDbModel locationDbModel) async {
    await _locationDbModelDeletionAdapter.delete(locationDbModel);
  }
}

class _$WeatherDao extends WeatherDao {
  _$WeatherDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _weatherDbModelInsertionAdapter = InsertionAdapter(
            database,
            'weather',
            (WeatherDbModel item) => <String, Object?>{
                  'id': item.id,
                  'countryCode': item.countryCode,
                  'lat': item.lat,
                  'lon': item.lon,
                  'temp': item.temp,
                  'tempMin': item.tempMin,
                  'tempMax': item.tempMax,
                  'weatherCode': item.weatherCode,
                  'weatherIcon': item.weatherIcon,
                  'weatherCondition': item.weatherCondition,
                  'dt': item.dt
                }),
        _weatherDbModelDeletionAdapter = DeletionAdapter(
            database,
            'weather',
            ['id'],
            (WeatherDbModel item) => <String, Object?>{
                  'id': item.id,
                  'countryCode': item.countryCode,
                  'lat': item.lat,
                  'lon': item.lon,
                  'temp': item.temp,
                  'tempMin': item.tempMin,
                  'tempMax': item.tempMax,
                  'weatherCode': item.weatherCode,
                  'weatherIcon': item.weatherIcon,
                  'weatherCondition': item.weatherCondition,
                  'dt': item.dt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WeatherDbModel> _weatherDbModelInsertionAdapter;

  final DeletionAdapter<WeatherDbModel> _weatherDbModelDeletionAdapter;

  @override
  Future<List<WeatherDbModel>> getWeathers() async {
    return _queryAdapter.queryList('SELECT * FROM weather',
        mapper: (Map<String, Object?> row) => WeatherDbModel(
            id: row['id'] as String,
            countryCode: row['countryCode'] as String,
            lat: row['lat'] as double,
            lon: row['lon'] as double,
            temp: row['temp'] as double,
            tempMin: row['tempMin'] as double,
            tempMax: row['tempMax'] as double,
            weatherCode: row['weatherCode'] as int,
            weatherIcon: row['weatherIcon'] as String,
            weatherCondition: row['weatherCondition'] as String,
            dt: row['dt'] as int));
  }

  @override
  Future<WeatherDbModel?> getWeatherById(String id) async {
    return _queryAdapter.query('SELECT * FROM weather WHERE id = ?1',
        mapper: (Map<String, Object?> row) => WeatherDbModel(
            id: row['id'] as String,
            countryCode: row['countryCode'] as String,
            lat: row['lat'] as double,
            lon: row['lon'] as double,
            temp: row['temp'] as double,
            tempMin: row['tempMin'] as double,
            tempMax: row['tempMax'] as double,
            weatherCode: row['weatherCode'] as int,
            weatherIcon: row['weatherIcon'] as String,
            weatherCondition: row['weatherCondition'] as String,
            dt: row['dt'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertWeather(WeatherDbModel weatherDbModel) async {
    await _weatherDbModelInsertionAdapter.insert(
        weatherDbModel, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteWeather(WeatherDbModel weatherDbModel) async {
    await _weatherDbModelDeletionAdapter.delete(weatherDbModel);
  }
}

class _$CountryDao extends CountryDao {
  _$CountryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _countryDbModelInsertionAdapter = InsertionAdapter(
            database,
            'country',
            (CountryDbModel item) =>
                <String, Object?>{'code': item.code, 'name': item.name}),
        _countryDbModelDeletionAdapter = DeletionAdapter(
            database,
            'country',
            ['code'],
            (CountryDbModel item) =>
                <String, Object?>{'code': item.code, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CountryDbModel> _countryDbModelInsertionAdapter;

  final DeletionAdapter<CountryDbModel> _countryDbModelDeletionAdapter;

  @override
  Future<CountryDbModel?> getCountryByCode(String code) async {
    return _queryAdapter.query('SELECT * FROM country WHERE code = ?1',
        mapper: (Map<String, Object?> row) => CountryDbModel(
            code: row['code'] as String, name: row['name'] as String),
        arguments: [code]);
  }

  @override
  Future<void> insertCountry(CountryDbModel favoriteDbModel) async {
    await _countryDbModelInsertionAdapter.insert(
        favoriteDbModel, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteCountry(CountryDbModel favoriteDbModel) async {
    await _countryDbModelDeletionAdapter.delete(favoriteDbModel);
  }
}

class _$FavoriteDao extends FavoriteDao {
  _$FavoriteDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _favoriteDbModelInsertionAdapter = InsertionAdapter(
            database,
            'favorite',
            (FavoriteDbModel item) =>
                <String, Object?>{'locationId': item.locationId}),
        _favoriteDbModelDeletionAdapter = DeletionAdapter(
            database,
            'favorite',
            ['locationId'],
            (FavoriteDbModel item) =>
                <String, Object?>{'locationId': item.locationId});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FavoriteDbModel> _favoriteDbModelInsertionAdapter;

  final DeletionAdapter<FavoriteDbModel> _favoriteDbModelDeletionAdapter;

  @override
  Future<List<FavoriteDbModel>> getFavorites() async {
    return _queryAdapter.queryList('SELECT * FROM favorite',
        mapper: (Map<String, Object?> row) =>
            FavoriteDbModel(locationId: row['locationId'] as String));
  }

  @override
  Future<FavoriteDbModel?> getFavoriteByLocationId(String locationId) async {
    return _queryAdapter.query('SELECT * FROM favorite WHERE locationId = ?1',
        mapper: (Map<String, Object?> row) =>
            FavoriteDbModel(locationId: row['locationId'] as String),
        arguments: [locationId]);
  }

  @override
  Future<void> insertFavorite(FavoriteDbModel favoriteDbModel) async {
    await _favoriteDbModelInsertionAdapter.insert(
        favoriteDbModel, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteFavorite(FavoriteDbModel favoriteDbModel) async {
    await _favoriteDbModelDeletionAdapter.delete(favoriteDbModel);
  }
}

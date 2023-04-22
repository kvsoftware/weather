import '../../data/repository/data_repository.dart';
import '../../data/repository/geo_repository.dart';
import '../mapper/location_model_mapper.dart';
import '../model/weather_model.dart';

class GetWeathersUseCase {
  final GeoRepository _geoRepository;
  final DataRepository _dataRepository;
  GetWeathersUseCase(this._geoRepository, this._dataRepository);

  Future<List<WeatherModel>> invoke(
    String appId,
    String q, {
    String? limit,
  }) async {
    var locationEntities = await _geoRepository.getLocations(
      appId,
      q,
      limit: 5,
    );
    var weatherModels = <WeatherModel>[];
    for (var locationEntity in locationEntities) {
      var data = await _dataRepository.getWeatherData(
        appId,
        lat: locationEntity.lat!,
        lon: locationEntity.lon!,
        units: 'metric',
      );
      weatherModels.add(
        locationEntity.toWeatherModel(
          id: data.id,
          cityName: data.name,
          temp: data.main?.temp,
          dt: data.dt,
          weathers: data.weather,
        ),
      );
    }
    return weatherModels;
  }
}

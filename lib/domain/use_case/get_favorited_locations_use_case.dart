import '../../data/repository/weather_repository.dart';
import '../model/location_weather_model.dart';

class GetFavoritedLocationsUseCase {
  final WeatherRepository _weatherRepository;

  GetFavoritedLocationsUseCase(this._weatherRepository);

  Future<List<LocationWeatherModel>> invoke() async {
    return [];
  }
}

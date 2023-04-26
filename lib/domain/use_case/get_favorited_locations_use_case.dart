import '../../data/repository/weather_repository.dart';
import '../entity/weather_entity.dart';

class GetFavoritedLocationsUseCase {
  final WeatherRepository _weatherRepository;

  GetFavoritedLocationsUseCase(this._weatherRepository);

  Future<List<WeatherEntity>> invoke() async {
    return [];
  }
}

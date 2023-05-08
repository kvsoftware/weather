import '../../data/repository/map_preference_repository.dart';

class GetWeatherMapLayerUseCase {
  final MapPreferenceRepository _mapPreferenceRepository;

  GetWeatherMapLayerUseCase(this._mapPreferenceRepository);

  Future<String?> invoke() async {
    return await _mapPreferenceRepository.getWeatherMapLayer();
  }
}

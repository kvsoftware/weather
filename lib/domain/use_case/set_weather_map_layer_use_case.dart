import '../../data/repository/map_preference_repository.dart';

class SetWeatherMapLayerUseCase {
  final MapPreferenceRepository _mapPreferenceRepository;
  SetWeatherMapLayerUseCase(this._mapPreferenceRepository);

  Future<void> invoke(String weatherMapLayer) async {
    return await _mapPreferenceRepository.setWeatherMapLayer(weatherMapLayer);
  }
}

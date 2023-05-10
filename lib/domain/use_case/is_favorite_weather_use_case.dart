import '../../data/repository/favorite_repository.dart';

class IsFavoriteWeatherUseCase {
  final FavoriteRepository _favoriteRepository;
  IsFavoriteWeatherUseCase(this._favoriteRepository);

  Future<bool> invoke(String locationId) async {
    return await _favoriteRepository.getFavoriteByLocationId(locationId) != null;
  }
}

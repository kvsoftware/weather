import '../../data/repository/favorite_repository.dart';

class FavoriteLocationWeatherUseCase {
  final FavoriteRepository _favoriteRepository;

  FavoriteLocationWeatherUseCase(this._favoriteRepository);

  Future<void> invoke(String locationId, bool isFavorited) async {
    return isFavorited ? _favoriteRepository.setFavorite(locationId) : _favoriteRepository.deleteFavorite(locationId);
  }
}

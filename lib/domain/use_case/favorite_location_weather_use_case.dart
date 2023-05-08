import '../../data/repository/favorite_repository.dart';

class FavoriteLocationWeatherUseCase {
  final FavoriteRepository _favoriteRepository;

  FavoriteLocationWeatherUseCase(this._favoriteRepository);

  Future<void> invoke(int weatherId, bool isFavorited) async {
    return isFavorited ? _favoriteRepository.setFavorite(weatherId) : _favoriteRepository.deleteFavorite(weatherId);
  }
}

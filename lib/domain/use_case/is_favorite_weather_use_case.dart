import '../../data/repository/favorite_repository.dart';

class IsFavoriteWeatherUseCase {
  final FavoriteRepository _favoriteRepository;
  IsFavoriteWeatherUseCase(this._favoriteRepository);

  Future<bool> invoke(int weatherId) async {
    return await _favoriteRepository.getFavoriteById(weatherId) != null;
  }
}

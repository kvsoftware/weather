import '../../ui/page/home/favorites/favorites_controller.dart';
import '../../ui/page/home/map/map_controller.dart';

abstract class FavoriteListener {
  void onFavoriteUpdated();
}

class FavoriteManager {
  FavoriteListener? favoriteListener;
  FavoriteListener? mapListener;

  addListenerInFavoritePage(FavoritesController controller) {
    favoriteListener = controller;
  }

  addListenerInMapPage(MapController state) {
    mapListener = state;
  }

  onUpdateFavorite() {
    favoriteListener?.onFavoriteUpdated();
    mapListener?.onFavoriteUpdated();
  }
}

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../domain/use_case/get_camera_position_use_case.dart';
import '../../../../domain/use_case/get_favorited_locations_use_case.dart';
import '../../../../domain/use_case/get_weather_map_layer_use_case.dart';
import '../../../../domain/use_case/get_weather_map_tile_use_case.dart';
import '../../../../domain/use_case/set_camera_position_use_case.dart';
import '../../../../domain/use_case/set_weather_map_layer_use_case.dart';
import '../../../base_controller.dart';
import '../../../mapper/weather_view_model_mapper.dart';
import 'weather_map_tile_enum.dart';
import 'weather_map_tile_provider.dart';

class MapController extends BaseController {
  final GetCameraPositionUseCase _getCameraPositionUseCase;
  final SetCameraPositionUseCase _setCameraPositionUseCase;
  final GetWeatherMapTileUseCase _getWeatherMapTileUseCase;
  final GetFavoritedLocationsUseCase _getFavoritedLocationsUseCase;
  final GetWeatherMapLayerUseCase _getWeatherMapLayerUseCase;
  final SetWeatherMapLayerUseCase _setWeatherMapLayerUseCase;

  MapController(
    this._getCameraPositionUseCase,
    this._setCameraPositionUseCase,
    this._getWeatherMapTileUseCase,
    this._getFavoritedLocationsUseCase,
    this._getWeatherMapLayerUseCase,
    this._setWeatherMapLayerUseCase,
  );

  late GoogleMapController mapController;
  double latitude = 55.024076;
  double longitude = -2.712217;
  double zoom = 5;

  final markers = <Marker>[].obs;
  final weatherMapTile = Rxn<WeatherMapTileEnum>();
  final weatherMapLayer = <TileOverlay>{}.obs;

  void onCameraMove(CameraPosition cameraPosition) {
    latitude = cameraPosition.target.latitude;
    longitude = cameraPosition.target.longitude;
    zoom = cameraPosition.zoom;
  }

  void onCameraIdle() {
    _setCameraPosition();
  }

  void onMapCreated(GoogleMapController mapController) {
    this.mapController = mapController;
    _getFavoritedWeathers();
    _getCameraPosition();
    _getWeatherMapLayer();
    _onWeatherMapTileChanged();
  }

  void _getCameraPosition() async {
    try {
      final response = await _getCameraPositionUseCase.invoke();
      if (response == null) return;
      mapController.moveCamera(
        CameraUpdate.newLatLngZoom(LatLng(response.latitude, response.longitude), response.zoom),
      );
    } catch (e) {
      // Do nothing
    }
  }

  void _setCameraPosition() async {
    try {
      await _setCameraPositionUseCase.invoke(latitude, longitude, zoom);
    } catch (e) {
      // Do nothing
    }
  }

  void _getFavoritedWeathers() async {
    isLoading(true);
    try {
      var weatherEntities = await _getFavoritedLocationsUseCase.invoke();
      var markers = weatherEntities.map((e) => e.toMarker()).toList();
      this.markers(markers);
    } catch (e) {
      // Do nothing
    }
    isLoading(false);
  }

  void _getWeatherMapLayer() async {
    try {
      final response = await _getWeatherMapLayerUseCase.invoke();
      String mapType;
      if (response == null) {
        _setWeatherMapLayer(WeatherMapTileEnum.clouds.value);
        mapType = WeatherMapTileEnum.clouds.value;
      } else {
        mapType = response;
      }
      weatherMapTile(getWeatherMapTileEnumByValue(mapType));
    } catch (e) {
      // Do nothing
    }
  }

  void _onWeatherMapTileChanged() {
    weatherMapTile.listen(
      (p0) {
        if (p0 == null) return;
        _setWeatherMapLayer(p0.value);
        weatherMapLayer(
          {
            TileOverlay(
              tileOverlayId: TileOverlayId(p0.value),
              tileProvider: WeatherMapTileProvider(_getWeatherMapTileUseCase, p0.value),
            )
          },
        );
      },
    );
  }

  void _setWeatherMapLayer(String weatherMapLayer) async {
    try {
      await _setWeatherMapLayerUseCase.invoke(weatherMapLayer);
    } catch (e) {
      // Do nothing
    }
  }

  WeatherMapTileEnum getWeatherMapTileEnumByValue(String value) {
    if (value == WeatherMapTileEnum.clouds.value) return WeatherMapTileEnum.clouds;
    if (value == WeatherMapTileEnum.precipitation.value) return WeatherMapTileEnum.precipitation;
    if (value == WeatherMapTileEnum.pressure.value) return WeatherMapTileEnum.pressure;
    if (value == WeatherMapTileEnum.wind.value) return WeatherMapTileEnum.wind;
    return WeatherMapTileEnum.temp;
  }
}

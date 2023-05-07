import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../domain/use_case/get_camera_position_use_case.dart';
import '../../../../domain/use_case/get_weather_map_tile_use_case.dart';
import '../../../../domain/use_case/set_camera_position_use_case.dart';
import '../../../base_controller.dart';

class MapController extends BaseController {
  final GetCameraPositionUseCase _getCameraPositionUseCase;
  final SetCameraPositionUseCase _setCameraPositionUseCase;
  final GetWeatherMapTileUseCase _getWeatherMapTileUseCase;

  MapController(this._getCameraPositionUseCase, this._setCameraPositionUseCase, this._getWeatherMapTileUseCase);

  late GoogleMapController mapController;
  double latitude = 51.509865;
  double longitude = -0.118092;
  double zoom = 16;

  GetWeatherMapTileUseCase getGetWeatherMapTileUseCase() => _getWeatherMapTileUseCase;

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
    _getCameraPosition();
  }

  void _getCameraPosition() async {
    try {
      final response = await _getCameraPositionUseCase.invoke();
      if (response == null) return;
      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(response.latitude, response.longitude),
          response.zoom,
        ),
      );
    } catch (e) {
      print("error");
    }
  }

  void _setCameraPosition() async {
    try {
      await _setCameraPositionUseCase.invoke(latitude, longitude, zoom);
    } catch (e) {
      print("error");
    }
  }
}

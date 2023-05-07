import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../base_view_keep_alive.dart';
import 'map_controller.dart';
import 'weather_map_tile_provider.dart';

class MapView extends GetViewKeepAlive<MapController> {
  final LatLng latLng = const LatLng(0.0, 0.0);

  const MapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          if (controller.isOffline.isTrue) _buildNoInternetConnectionLayout(context),
          Expanded(
            child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.latitude, controller.longitude),
                  zoom: controller.zoom,
                ),
                tileOverlays: {
                  TileOverlay(
                    tileOverlayId: const TileOverlayId('precipitation_new_id'),
                    tileProvider: WeatherMapTileProvider(controller.getGetWeatherMapTileUseCase()),
                  )
                },
                onCameraMove: (position) => controller.onCameraMove(position),
                onCameraIdle: () => controller.onCameraIdle(),
                onMapCreated: (mapController) => controller.onMapCreated(mapController)),
          ),
        ],
      ),
    );
  }

  Widget _buildNoInternetConnectionLayout(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      color: Colors.blueGrey,
      child: const Text("No internet connection", textAlign: TextAlign.center),
    );
  }
}

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
          if (controller.isOffline.isTrue) buildNoInternetConnectionLayout(context),
          Expanded(
            child: Stack(
              children: [
                _buildMap(),
                _buildLayerButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return GoogleMap(
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
      mapToolbarEnabled: false,
      zoomControlsEnabled: false,
      markers: Set<Marker>.of(controller.markers),
      onCameraMove: (position) => controller.onCameraMove(position),
      onCameraIdle: () => controller.onCameraIdle(),
      onMapCreated: (mapController) => controller.onMapCreated(mapController),
    );
  }

  Widget _buildLayerButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
          onPressed: () => _openLayerDialog(),
          child: const Icon(Icons.layers),
        ),
      ),
    );
  }

  void _openLayerDialog() {
    Get.defaultDialog(
      title: "Select layer",
      content: Column(
        children: [],
      ),
    );
  }
}

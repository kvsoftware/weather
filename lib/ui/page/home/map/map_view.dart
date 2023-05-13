import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../generated/locales.g.dart';
import '../../../base_view_keep_alive.dart';
import 'map_controller.dart';
import 'weather_map_tile_enum.dart';

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
      tileOverlays: controller.weatherMapLayer,
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
      title: LocaleKeys.map_dialog_select_layer_title.tr,
      content: Obx(
        () => Column(
          children: [
            RadioListTile<WeatherMapTileEnum>(
              value: WeatherMapTileEnum.clouds,
              groupValue: controller.weatherMapTile.value,
              onChanged: (value) => controller.weatherMapTile(value),
              title: Text(LocaleKeys.map_dialog_select_layer_option_clouds.tr),
            ),
            RadioListTile<WeatherMapTileEnum>(
              value: WeatherMapTileEnum.precipitation,
              groupValue: controller.weatherMapTile.value,
              onChanged: (value) => controller.weatherMapTile(value),
              title: Text(LocaleKeys.map_dialog_select_layer_option_precipitation.tr),
            ),
            RadioListTile<WeatherMapTileEnum>(
              value: WeatherMapTileEnum.pressure,
              groupValue: controller.weatherMapTile.value,
              onChanged: (value) => controller.weatherMapTile(value),
              title: Text(LocaleKeys.map_dialog_select_layer_option_sea_level_pressure.tr),
            ),
            RadioListTile<WeatherMapTileEnum>(
              value: WeatherMapTileEnum.wind,
              groupValue: controller.weatherMapTile.value,
              onChanged: (value) => controller.weatherMapTile(value),
              title: Text(LocaleKeys.map_dialog_select_layer_option_wind_speed.tr),
            ),
            RadioListTile<WeatherMapTileEnum>(
              value: WeatherMapTileEnum.temp,
              groupValue: controller.weatherMapTile.value,
              onChanged: (value) => controller.weatherMapTile(value),
              title: Text(LocaleKeys.map_dialog_select_layer_option_temperature.tr),
            ),
          ],
        ),
      ),
      textConfirm: LocaleKeys.map_dialog_select_layer_button_close.tr,
      onConfirm: () => Get.back(),
    );
  }
}

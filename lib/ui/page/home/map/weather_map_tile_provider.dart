import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../domain/use_case/get_weather_map_tile_use_case.dart';

class WeatherMapTileProvider implements TileProvider {
  final GetWeatherMapTileUseCase _getWeatherMapTileUseCase;
  WeatherMapTileProvider(this._getWeatherMapTileUseCase);

  Tile transTile = Tile(0, 0, Uint8List.fromList([1]));
  int tileSize = 256;

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    const mapType = "temp_new";
    final data = await _getWeatherMapTileUseCase.invoke(mapType, x, y, zoom ?? 1);
    return Tile(tileSize, tileSize, data);
  }
}

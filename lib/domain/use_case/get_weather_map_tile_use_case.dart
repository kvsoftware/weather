import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/map_repository.dart';

class GetWeatherMapTileUseCase {
  final MapRepository _mapRepository;
  GetWeatherMapTileUseCase(this._mapRepository);

  Future<Uint8List> invoke(String mapType, int x, int y, int zoom) async {
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
    return _mapRepository.getWeatherMapTile(appId: apiKey, mapType: mapType, x: x, y: y, zoom: zoom);
  }
}

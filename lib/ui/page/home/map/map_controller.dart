import '../../../../domain/use_case/get_weather_map_tile_use_case.dart';
import '../../../base_controller.dart';

class MapController extends BaseController {
  final GetWeatherMapTileUseCase getWeatherMapTileUseCase;
  MapController(this.getWeatherMapTileUseCase);
}

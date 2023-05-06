import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'map_service.g.dart';

@RestApi()
abstract class MapService {
  factory MapService(Dio dio) = _MapService;

  @GET("https://tile.openweathermap.org/map/{mapType}/{zoom}/{x}/{y}.png")
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> getWeatherMapTile({
    @Query("appid") required String appId,
    @Path("mapType") required String mapType,
    @Path("x") required int x,
    @Path("y") required int y,
    @Path("zoom") required int zoom,
  });
}

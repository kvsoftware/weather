import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/location_api_model.dart';

part 'geo_service.g.dart';

@RestApi()
abstract class GeoService {
  factory GeoService(Dio dio) = _GeoService;

  @GET("geo/1.0/direct")
  Future<List<LocationApiModel>> getLocations({
    @Query("appid") required String apiKey,
    @Query('q') required String q,
    @Query("limit") int? limit,
  });
}

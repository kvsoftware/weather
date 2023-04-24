import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entity/response/forecast_response.dart';
import '../entity/weather_entity.dart';

part 'data_service.g.dart';

@RestApi()
abstract class DataService {
  factory DataService(Dio dio) = _DataService;

  @GET("data/2.5/weather")
  Future<WeatherEntity> getWeatherData(
    @Query("appid") String appId, {
    @Query("id") int? id,
    @Query("lat") double? lat,
    @Query('lon') double? lon,
    @Query("units") String? units,
    @Query("lang") String? lang,
  });

  @GET("data/2.5/forecast")
  Future<ForecastResponse> getForecastWeathers(
    @Query("appid") String appId, {
    @Query("id") int? id,
    @Query("lat") double? lat,
    @Query('lon') double? lon,
    @Query("units") String? units,
    @Query("lang") String? lang,
  });
}

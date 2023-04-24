import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/forecast_response.dart';
import '../model/weather_model.dart';

part 'data_service.g.dart';

@RestApi()
abstract class DataService {
  factory DataService(Dio dio) = _DataService;

  @GET("data/2.5/weather")
  Future<WeatherModel> getWeatherData(
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

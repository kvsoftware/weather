import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/weathers_response.dart';
import '../model/weather_api_model.dart';

part 'data_service.g.dart';

@RestApi()
abstract class DataService {
  factory DataService(Dio dio) = _DataService;

  @GET("data/2.5/weather")
  Future<WeatherApiModel> getWeather(
    @Query("appid") String appId, {
    @Query("id") int? id,
    @Query("lat") double? lat,
    @Query('lon') double? lon,
    @Query("units") String? units,
    @Query("lang") String? lang,
  });

  @GET("data/2.5/forecast")
  Future<WeathersResponse> getForecastWeathersByLatLng({
    @Query("appid") required String apiKey,
    @Query("lat") required double lat,
    @Query('lon') required double lon,
    @Query("units") String? units,
    @Query("lang") String? lang,
  });
}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/weathers_response.dart';
import '../model/weather_api_model.dart';

part 'data_service.g.dart';

@RestApi()
abstract class DataService {
  factory DataService(Dio dio) = _DataService;

  @GET("data/2.5/onecall")
  Future<WeatherApiModel> getWeatherByLatLng({
    @Query("appid") required String apiKey,
    @Query("lat") required double lat,
    @Query('lon') required double lon,
    @Query("units") String? units,
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

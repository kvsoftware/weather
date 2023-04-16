import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'open_weather_service.g.dart';

@RestApi()
abstract class OpenWeatherService {
  factory OpenWeatherService(Dio dio) = _OpenWeatherService;

  @POST("/onecall")
  @FormUrlEncoded()
  Future<String> login(
    @Field("email") String email,
    @Field("password") String password,
    @Field("siteCode") String siteCode,
  );
}

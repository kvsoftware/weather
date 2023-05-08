import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/country_api_model.dart';

part 'country_service.g.dart';

@RestApi()
abstract class CountryService {
  factory CountryService(Dio dio) = _CountryService;

  @GET("https://restcountries.com/v3.1/alpha/{countryCode}")
  Future<List<CountryApiModel>> getCountryByCode({@Path("countryCode") required String code});
}

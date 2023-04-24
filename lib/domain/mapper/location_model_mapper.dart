import '../../data/datasource/remote/model/location_model.dart';
import '../../data/datasource/remote/model/weather_condition_model.dart';
import '../model/location_weather_model.dart';

extension LocationModelParsing on LocationModel {
  LocationWeatherModel toLocationWeatherDetailModel({
    int? id,
    String? cityName,
    double? temp,
    int? dt,
    List<WeatherConditionModel>? weathers,
  }) {
    return LocationWeatherModel(
      id: id,
      name: name,
      cityName: cityName,
      country: country,
      temp: _getTemp(temp),
      weatherIconPath: _getWeatherIconPath(weathers),
      weatherCondition: _getWeatherCondition(weathers),
    );
  }

  _getTemp(double? temp) {
    if (temp == null) return null;
    return temp.round();
  }

  _getWeatherIconPath(List<WeatherConditionModel>? weathers) {
    if (weathers == null) return null;
    if (weathers.isEmpty) return null;
    return 'https://openweathermap.org/img/wn/${weathers![0].icon}@4x.png';
  }

  _getWeatherCondition(List<WeatherConditionModel>? weathers) {
    if (weathers == null) return null;
    if (weathers.isEmpty) return null;
    return weathers[0].main ?? '';
  }
}

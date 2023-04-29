import '../../ui/view_model/weather_detail_view_model.dart';
import '../../ui/view_model/weather_view_model.dart';
import '../entity/weather_entity.dart';

extension WeatherViewModelMapper on WeatherEntity {
  WeatherViewModel toWeatherViewModel() {
    return WeatherViewModel(
      id: id,
      name: name,
      temp: temp?.roundToDouble(),
      weatherIcon: weatherIcon,
    );
  }

  WeatherDetailViewModel toWeatherDetailViewModel() {
    return WeatherDetailViewModel(
        id: id,
        name: name,
        temp: temp?.roundToDouble(),
        tempMin: tempMin?.roundToDouble(),
        tempMax: tempMax?.roundToDouble(),
        weatherIcon: weatherIcon,
        weatherCondition: weatherCondition,
        dateTime: dt);
  }
}

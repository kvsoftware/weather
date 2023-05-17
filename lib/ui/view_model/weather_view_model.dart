import 'daily_view_model.dart';
import 'hourly_view_model.dart';

class WeatherViewModel {
  String id;
  String name;
  String stateWithCountryName;
  int temp;
  String weatherIcon;
  List<HourlyViewModel> hourlies;
  List<DailyViewModel> dailies;

  WeatherViewModel({
    required this.id,
    required this.name,
    required this.stateWithCountryName,
    required this.temp,
    required this.weatherIcon,
    required this.hourlies,
    required this.dailies,
  });
}

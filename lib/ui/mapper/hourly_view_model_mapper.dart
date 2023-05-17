import '../../domain/entity/hourly_entity.dart';
import '../view_model/hourly_view_model.dart';
import 'icon_mapper.dart';

extension HourlyEntityMapper on HourlyEntity {
  HourlyViewModel toHourlyViewModel() {
    return HourlyViewModel(temp: temp, weatherCode: weatherCode, weatherIconPath: getIcon(weatherIcon), dt: dt);
  }
}

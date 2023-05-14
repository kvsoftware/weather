import '../../domain/entity/hourly_entity.dart';
import '../view_model/hourly_view_model.dart';

extension HourlyEntityMapper on HourlyEntity {
  HourlyViewModel toHourlyViewModel() {
    return HourlyViewModel(temp: temp, weatherCode: weatherCode, weatherIconPath: weatherIconPath, dt: dt);
  }
}

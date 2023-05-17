import '../../domain/entity/daily_entity.dart';
import '../view_model/daily_view_model.dart';
import 'icon_mapper.dart';

extension DailyEntityMapper on DailyEntity {
  DailyViewModel toDailyViewModel() {
    return DailyViewModel(
      tempMin: tempMin,
      tempMax: tempMax,
      weatherCode: weatherCode,
      weatherIconPath: getIcon(weatherIcon),
      weatherCondition: weatherCondition,
      dt: dt,
    );
  }
}

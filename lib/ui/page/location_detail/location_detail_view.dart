import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../domain/entity/forecast_weather_entity.dart';
import '../../base_view.dart';
import 'location_detail_controller.dart';

class LocationDetailArgument {
  final int weatherId;
  LocationDetailArgument(this.weatherId);
}

class LocationDetailView extends BaseView<LocationDetailController> {
  const LocationDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
                icon: Icon(
                  controller.isFavorited.value ? Icons.favorite : Icons.favorite_border_outlined,
                  color: Colors.white,
                ),
                onPressed: () => controller.updateFavorite())
          ],
        ),
        body: Column(
          children: [
            if (controller.isOffline.isTrue) buildNoInternetConnectionLayout(context),
            Expanded(
              child: RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: Stack(
                  children: [
                    if (controller.weatherDetail.value != null) _buildMainLayout(),
                    if (controller.isLoading.isTrue) const Center(child: CircularProgressIndicator())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainLayout() {
    return SingleChildScrollView(
      child: Container(
        color: controller.weatherDetail.value?.color,
        child: Column(
          children: [
            _buildWeatherData(),
            _buildForecastWeathers(),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherData() {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${controller.weatherDetail.value?.name}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 4),
            Text(
              "${controller.weatherDetail.value?.countryName}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            Text(_getDateTime(controller.weatherDetail.value?.dateTime) ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  controller.weatherDetail.value!.weatherIcon!,
                  height: 150,
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  '${controller.weatherDetail.value?.temp}°',
                  style: const TextStyle(fontSize: 80),
                ),
              ],
            ),
            Text(
              '${controller.weatherDetail.value?.tempMin}° / ${controller.weatherDetail.value?.tempMax}°',
            ),
            const SizedBox(height: 8),
            Text('${controller.weatherDetail.value?.weatherCondition}'),
          ],
        ),
      ),
    );
  }

  Widget _buildForecastWeathers() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: controller.forecastWeathers.length,
      itemBuilder: (context, index) => Container(
        child: _buildForecastWeather(
          controller.forecastWeathers[index],
        ),
      ),
    );
  }

  Widget _buildForecastWeather(ForecastWeatherEntity forecastWeatherEntity) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(forecastWeatherEntity.dateTime ?? ''),
                  const SizedBox(height: 4),
                  Text(
                    forecastWeatherEntity.weatherCondition ?? '',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            if (forecastWeatherEntity.weatherIconPath != null) ...[
              Row(
                children: [
                  Image.network(forecastWeatherEntity.weatherIconPath!, width: 60),
                  Text('${forecastWeatherEntity.temp.toString()}°'),
                ],
              )
            ],
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${forecastWeatherEntity.tempMax}°'),
                const SizedBox(height: 4),
                Text(
                  '${forecastWeatherEntity.tempMin}°',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _getDateTime(DateTime? dateTime) {
    if (dateTime == null) return null;
    final now = DateTime.now();

    if (DateUtils.isSameDay(dateTime, now)) {
      return 'Today ${DateFormat('kk:mm').format(dateTime)}';
    }
    return DateFormat('EEE d MMMM, kk:mm').format(dateTime);
  }
}

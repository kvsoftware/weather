import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/model/forecast_weather_model.dart';
import '../controllers/location_detail_controller.dart';

class LocationDetailArgument {
  final int weatherId;
  LocationDetailArgument(this.weatherId);
}

class LocationDetailView extends GetView<LocationDetailController> {
  const LocationDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(controller.weatherDetail.value?.name ?? ''),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  controller.isFavorited.value
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: Colors.white,
                ),
                onPressed: () => controller.updateFavorite())
          ],
        ),
        body: Stack(
          children: [
            if (controller.weatherDetail.value != null) _buildMainLayout(),
            if (controller.isLoading.value) _builLoadingLayout(),
          ],
        ),
      ),
    );
  }

  _builLoadingLayout() {
    return const Center(child: CircularProgressIndicator());
  }

  _buildMainLayout() {
    return Column(
      children: [
        _buildWeatherData(),
        _buildForecastWeathers(),
      ],
    );
  }

  _buildWeatherData() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${controller.weatherDetail.value?.dateTime}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                controller.weatherDetail.value!.weatherIconPath!,
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
            '${controller.weatherDetail.value?.tempMin}°/${controller.weatherDetail.value?.tempMax}°',
          ),
          const SizedBox(height: 8),
          Text('${controller.weatherDetail.value?.weatherCondition}'),
        ],
      ),
    );
  }

  _buildForecastWeathers() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: controller.forecastWeathers.value.length,
        itemBuilder: (context, index) => Container(
          child: _buildForecastWeather(
            controller.forecastWeathers.value[index],
          ),
        ),
      ),
    );
  }

  _buildForecastWeather(ForecastWeatherModel forecastWeather) {
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
                  Text(forecastWeather.dateTime ?? ''),
                  const SizedBox(height: 4),
                  Text(
                    forecastWeather.weatherCondition ?? '',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            if (forecastWeather.weatherIconPath != null) ...[
              Row(
                children: [
                  Image.network(forecastWeather.weatherIconPath!, width: 60),
                  Text('${forecastWeather.temp.toString()}°'),
                ],
              )
            ],
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${forecastWeather.tempMax}°'),
                const SizedBox(height: 4),
                Text(
                  '${forecastWeather.tempMin}°',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

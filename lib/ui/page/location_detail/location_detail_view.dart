import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../generated/locales.g.dart';
import '../../base_view.dart';
import '../../view_model/daily_view_model.dart';
import '../../view_model/hourly_view_model.dart';
import 'location_detail_controller.dart';

class LocationDetailArgument {
  final String id;
  LocationDetailArgument(this.id);
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
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
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
      ),
    );
  }

  Widget _buildMainLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildWeatherData(),
          _buildHourlies(),
          _buildDailies(),
        ],
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
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 16),
            Text(
              "${controller.weatherDetail.value?.state}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 4),
            Text(
              "${controller.weatherDetail.value?.countryName}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            Text(_getDateTimeForCurrent(controller.weatherDetail.value?.dateTime)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  controller.weatherDetail.value!.weatherIcon,
                  height: 150,
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  '${controller.weatherDetail.value?.temp}°',
                  style: const TextStyle(fontSize: 80),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('${controller.weatherDetail.value?.weatherCondition}'),
          ],
        ),
      ),
    );
  }

  Widget _buildHourlies() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.weatherDetail.value!.dailies.length,
        itemBuilder: (context, index) => Container(
          child: _buildHourly(controller.weatherDetail.value!.hourlies[index]),
        ),
      ),
    );
  }

  Widget _buildHourly(HourlyViewModel hourlyViewModel) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${hourlyViewModel.temp}°'),
            if (hourlyViewModel.weatherIconPath.isNotEmpty) ...[
              Image.asset(hourlyViewModel.weatherIconPath, width: 60)
            ],
            Text(_getDateTimeForHourly(hourlyViewModel.dt)),
          ],
        ),
      ),
    );
  }

  Widget _buildDailies() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: controller.weatherDetail.value!.dailies.length,
      itemBuilder: (context, index) => Container(
        child: _buildDaily(controller.weatherDetail.value!.dailies[index]),
      ),
    );
  }

  Widget _buildDaily(DailyViewModel dailyViewModel) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_getDateTimeForDaily(dailyViewModel.dt)),
                  const SizedBox(height: 4),
                  Text(
                    dailyViewModel.weatherCondition,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            if (dailyViewModel.weatherIconPath.isNotEmpty) ...[Image.asset(dailyViewModel.weatherIconPath, width: 60)],
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${dailyViewModel.tempMax}°'),
                const SizedBox(height: 4),
                Text('${dailyViewModel.tempMin}°', style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getDateTimeForCurrent(DateTime? dateTime) {
    if (dateTime == null) return '';
    final now = DateTime.now();

    if (DateUtils.isSameDay(dateTime, now)) {
      return '${LocaleKeys.location_detail_today.tr} ${DateFormat('kk:mm').format(dateTime)}';
    }
    return DateFormat('EEE d MMMM, kk:mm').format(dateTime);
  }

  String _getDateTimeForHourly(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('kk:mm').format(dateTime);
  }

  String _getDateTimeForDaily(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('EEE d MMMM').format(dateTime);
  }
}

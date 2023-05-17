import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../base_view_keep_alive.dart';
import '../../../routes/app_pages.dart';
import '../../../view_model/weather_view_model.dart';
import '../../location_detail/location_detail_view.dart';
import 'favorites_controller.dart';

class FavoritesView extends GetViewKeepAlive<FavoritesController> {
  const FavoritesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          if (controller.isOffline.isTrue) buildNoInternetConnectionLayout(context),
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.onRefresh,
              child: Stack(
                children: [
                  _buildListView(context),
                  if (controller.isLoading.isTrue) const Center(child: CircularProgressIndicator()),
                  if (controller.isLoading.isFalse && controller.locations.isEmpty)
                    Center(child: Text(LocaleKeys.global_no_data.tr)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: controller.locations.length,
      itemBuilder: (context, index) {
        return _buildItem(controller.locations.value[index]);
      },
    );
  }

  Widget _buildItem(WeatherViewModel weatherViewModel) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: InkWell(
        onTap: () => Get.toNamed(
          Routes.LOCATION_DETAIL,
          arguments: LocationDetailArgument(weatherViewModel.id),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weatherViewModel.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 22),
                    ),
                    Text(
                      weatherViewModel.stateWithCountryName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  if (weatherViewModel.weatherIcon.isNotEmpty) ...[
                    Image.asset(weatherViewModel.weatherIcon, width: 50),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    '${weatherViewModel.temp.toString()}°',
                    style: const TextStyle(fontSize: 40),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

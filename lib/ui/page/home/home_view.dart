import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../view_model/weather_view_model.dart';
import '../location_detail/location_detail_view.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () => Get.toNamed(Routes.SEARCH_LOCATION),
          )
        ],
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: Stack(
            children: [
              _buildListView(context),
              if (controller.locations.isEmpty) const Center(child: Text("Empty")),
              if (controller.isLoading.isTrue) const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }

  _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: controller.locations.length,
      itemBuilder: (context, index) {
        return _buildItem(controller.locations.value[index]);
      },
    );
  }

  _buildItem(WeatherViewModel weatherViewModel) {
    return Card(
      color: weatherViewModel.color,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: InkWell(
        onTap: () => Get.toNamed(
          Routes.LOCATION_DETAIL,
          arguments: LocationDetailArgument(weatherViewModel.id ?? 0),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                weatherViewModel.name ?? '',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 22),
              ),
              Row(
                children: [
                  if (weatherViewModel.weatherIcon != null) ...[
                    Image.network(weatherViewModel.weatherIcon!, width: 50),
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

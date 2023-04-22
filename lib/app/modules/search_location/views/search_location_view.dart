import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/model/weather_model.dart';
import '../../../routes/app_pages.dart';
import '../../location_detail/views/location_detail_view.dart';
import '../controllers/search_location_controller.dart';

class SearchLocationView extends GetView<SearchLocationController> {
  SearchLocationView({Key? key}) : super(key: key);

  final _textEditingcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Locations'),
        centerTitle: true,
      ),
      body: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                _buildTitle(),
                _buildListView(),
              ],
            ),
            if (controller.isLoading.value)
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _textEditingcontroller,
        onChanged: (value) => controller.onTextChanged(value),
      ),
    );
  }

  _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.locations.length,
        itemBuilder: (context, index) {
          return _buildItem(controller.locations.value[index]);
        },
      ),
    );
  }

  _buildItem(WeatherModel weatherModel) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: InkWell(
        onTap: () => Get.toNamed(
          Routes.LOCATION_DETAIL,
          arguments: LocationDetailArgument(weatherModel),
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
                      weatherModel.name ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      weatherModel.cityName ?? '',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      weatherModel.country ?? '',
                      style: const TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  if (weatherModel.weatherIconPath != null) ...[
                    Image.network(weatherModel.weatherIconPath!, width: 50),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    '${weatherModel.temp.toString()}°',
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

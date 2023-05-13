import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../../base_view.dart';
import '../../routes/app_pages.dart';
import '../../view_model/weather_view_model.dart';
import '../location_detail/location_detail_view.dart';
import 'search_location_controller.dart';

class SearchLocationView extends BaseView<SearchLocationController> {
  SearchLocationView({Key? key}) : super(key: key);

  final _textEditingcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.search_title.tr),
        centerTitle: true,
      ),
      body: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                if (controller.isOffline.isTrue) buildNoInternetConnectionLayout(context),
                _buildTitle(),
                _buildListView(),
              ],
            ),
            if (controller.isLoading.isTrue) const Center(child: CircularProgressIndicator()),
            if (controller.isLoading.isFalse && _textEditingcontroller.text.isNotEmpty && controller.locations.isEmpty)
              Center(child: Text(LocaleKeys.global_no_data.tr)),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: _textEditingcontroller,
          onChanged: (value) => controller.onTextChanged(value),
          decoration: InputDecoration(
            hintText: LocaleKeys.search_search_hint.tr,
            suffixIcon: const Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.locations.length,
        itemBuilder: (context, index) {
          return _buildItem(controller.locations.value[index]);
        },
      ),
    );
  }

  Widget _buildItem(WeatherViewModel weatherViewModel) {
    return Card(
      color: weatherViewModel.color,
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
                    Image.network(weatherViewModel.weatherIcon, width: 50),
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

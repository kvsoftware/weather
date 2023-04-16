import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../location_detail/views/location_detail_view.dart';
import '../../../routes/app_pages.dart';

import '../../../../domain/model/location_model.dart';
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

  _buildItem(LocationModel locationModel) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.LOCATION_DETAIL,
        arguments: LocationDetailArgument(locationModel),
      ),
      child: Card(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(locationModel.name ?? ''),
                Text(locationModel.country ?? ''),
                Text(locationModel.temp.toString()),
              ],
            )),
      ),
    );
  }
}

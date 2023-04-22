import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/location_detail_controller.dart';

class LocationDetailArgument {
  final int weatherId;
  LocationDetailArgument(this.weatherId);
}

class LocationDetailView extends GetView<LocationDetailController> {
  const LocationDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Obx(
        () => controller.weatherDetail.value != null
            ? SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(
                        controller.weatherDetail.value?.name ?? '',
                        style: const TextStyle(fontSize: 36),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Updated at : ${controller.weatherDetail.value?.dateTime}',
                      ),
                      const SizedBox(height: 8),
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
                      const SizedBox(height: 8),
                      Text(
                        '${controller.weatherDetail.value?.tempMax}°/${controller.weatherDetail.value?.tempMin}°',
                        style: const TextStyle(fontSize: 22),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${controller.weatherDetail.value?.weatherCondition}',
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../domain/model/location_model.dart';

import '../controllers/location_detail_controller.dart';

class LocationDetailArgument {
  final LocationModel locationModel;
  LocationDetailArgument(this.locationModel);
}

class LocationDetailView extends GetView<LocationDetailController> {
  const LocationDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LocationDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LocationDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

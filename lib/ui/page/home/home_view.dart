import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => Stack(
          children: [
            if (controller.isLoading.value)
              const Center(child: CircularProgressIndicator()),
            InkWell(
                onTap: () => Get.toNamed(Routes.SEARCH_LOCATION),
                child: Text("Click here"))
          ],
        ),
      ),
    );
  }
}

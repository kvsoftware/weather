import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'di/app_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: AppBinding(),
      getPages: AppPages.routes,
    ),
  );
}

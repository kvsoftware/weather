import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'di/app_binding.dart';

void main() async {
  await dotenv.load(fileName: 'config.env');
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: AppBinding(),
      getPages: AppPages.routes,
    ),
  );
}

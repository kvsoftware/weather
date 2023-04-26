import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'di/app_binding.dart';
import 'ui/routes/app_pages.dart';

void main() async {
  await dotenv.load(fileName: 'config.env');
  await AppBinding().dependencies();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

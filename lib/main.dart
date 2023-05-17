import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'di/app_binding.dart';
import 'generated/locales.g.dart';
import 'ui/routes/app_pages.dart';

void main() async {
  await dotenv.load(fileName: 'config.env');
  await AppBinding().dependencies();
  runApp(
    GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      translationsKeys: AppTranslation.translations,
      locale: _getDefaultLocale(),
      supportedLocales: {_getDefaultLocale()},
      fallbackLocale: _getDefaultLocale(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Locale _getDefaultLocale() => const Locale('en', 'US');

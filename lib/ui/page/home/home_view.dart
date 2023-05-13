import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../../base_view.dart';
import '../../routes/app_pages.dart';
import 'favorites/favorites_view.dart';
import 'home_controller.dart';
import 'map/map_view.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.home_title.tr),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.favorite)),
            Tab(icon: Icon(Icons.map)),
          ]),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () => Get.toNamed(Routes.SEARCH_LOCATION),
            )
          ],
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            FavoritesView(),
            MapView(),
          ],
        ),
      ),
    );
  }
}

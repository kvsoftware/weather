import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/locales.g.dart';

abstract class BaseView<T> extends GetView<T> {
  const BaseView({super.key});

  Widget buildNoInternetConnectionLayout(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      color: Colors.blueGrey,
      child: Text(LocaleKeys.global_no_internet_connection.tr, textAlign: TextAlign.center),
    );
  }
}

import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CricRushApp extends StatefulWidget {
  const CricRushApp({super.key});

  @override
  State<CricRushApp> createState() => _CricRushAppState();
}

class _CricRushAppState extends State<CricRushApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      getPages: Routes.routes,
      initialRoute: Routes.bottomPage,
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeCtrl>(HomeCtrl());
    Get.put<ToursCtrl>(ToursCtrl());
  }
}

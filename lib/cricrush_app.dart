import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/service/lmw_ser.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
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
      initialRoute: Routes.splashPage,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.background,
        canvasColor: AppColor.background,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeCtrl>(HomeCtrl());
    Get.put<ToursCtrl>(ToursCtrl());
    Get.put<LMWService>(LMWService());
    Get.put<MatchDetailsCtrl>(MatchDetailsCtrl());
  }
}

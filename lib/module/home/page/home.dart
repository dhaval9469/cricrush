import 'package:cricrush/ad_module/banner/banner_ad.dart';
import 'package:cricrush/ad_module/banner/large_banner.dart';
import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/home/ctrl/sorts_ctrl.dart';
import 'package:cricrush/module/home/widget/must_watch.dart';
import 'package:cricrush/module/home/widget/recent_match.dart';
import 'package:cricrush/module/home/widget/top_store.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sortsCtrl = Get.put(SortsCtrl());
  final homeCtrl = Get.find<HomeCtrl>();
  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: AppColor.card,
        toolbarHeight: context.hp(5),
        title: Text(
          "Dashboard",
          style: tDmSans(context, fontSize: context.sp(17), fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColor.background,
      body: Obx(
        () => homeCtrl.allML.value && tourCtrl.allNSSL.value
            ? Center(child: const DL())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecentMatch(),
                    Padding(
                      padding: EdgeInsets.only(top: context.hp(1)),
                      child: Center(child: LargeBannerAd()),
                    ),
                    MustWatch(),
                    TopStore(),
                    SizedBox(height: context.hp(2)),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: BannerAds(),
    );
  }
}

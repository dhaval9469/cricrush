import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/schedule/page/s_live.dart';
import 'package:cricrush/module/schedule/page/s_result.dart';
import 'package:cricrush/module/schedule/page/s_upcoming.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final homeCtrl = Get.find<HomeCtrl>();

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(() {

      if (!tabController.indexIsChanging) {
        // Interstitial.showInterstitialByCount();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColor.appbarBg,
        bottom: TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          controller: tabController,
          labelStyle: tabLabelTextStyle(context),
          unselectedLabelStyle: tabUnLabelTextStyle(context),
          indicatorSize: TabBarIndicatorSize.label,
          padding: EdgeInsets.zero,
          indicatorColor: AppColor.sTabColor,
          dividerColor: AppColor.tDivider,
          tabs: [
            Tab(
              height: context.hp(4),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
                child: Text("Live"),
              ),
            ),
            Tab(
              height: context.hp(4),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
                child: Text("UpComing"),
              ),
            ),
            Tab(
              height: context.hp(4),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
                child: Text("Finished"),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: [SLiveTab(), SUpcomingTab(), SResultTab()]),
    );
  }
}

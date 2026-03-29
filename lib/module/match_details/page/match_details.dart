import 'package:cricrush/ad_module/banner/banner_ad.dart';
import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/page/commentary.dart';
import 'package:cricrush/module/match_details/page/lm_details.dart';
import 'package:cricrush/module/match_details/page/overs.dart';
import 'package:cricrush/module/match_details/page/playing_xi.dart';
import 'package:cricrush/module/match_details/page/point_table.dart';
import 'package:cricrush/module/match_details/page/scoreboard.dart';
import 'package:cricrush/module/match_details/service/lmw_ser.dart';
import 'package:cricrush/module/match_details/widget/md_widget.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'match_info.dart';

class MatchDetails extends StatefulWidget {
  const MatchDetails({super.key});

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final mdCtrl = Get.find<MatchDetailsCtrl>();
  final lmwService = Get.find<LMWService>();
  final tourCtrl = Get.find<ToursCtrl>();
  final homeCtrl = Get.find<HomeCtrl>();

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 7, initialIndex: 2);
    callData();
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        Interstitial.showInterstitialByCount();
        if (tabController.index == 1) {
          mdCtrl.getScoreBoard(mdCtrl.matchId.value, silentRefresh: true);
        } else if (tabController.index == 3) {
          mdCtrl.getCommentary(mdCtrl.matchId.value, silentRefresh: true);
        } else if (tabController.index == 5) {
          mdCtrl.getOver(mdCtrl.matchId.value, silentRefresh: true);
        }
      }
    });
    super.initState();
  }

  Future<void> callData() async {
    final matchId = mdCtrl.matchId.value;
    await Future.wait([
      mdCtrl.getScoreBoard(matchId),
      mdCtrl.getCommentary(matchId),
      mdCtrl.getSquad(matchId),
      mdCtrl.getOver(matchId),
      mdCtrl.getPointTable(mdCtrl.seriesId.value),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) return;
        Interstitial.showInterstitialByBackCount();
        handleExit();
      },
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.appbarBg,
          titleSpacing: 0,
          toolbarHeight: context.hp(5),
          leading: GestureDetector(
            onTap: () {
              Interstitial.showInterstitialByBackCount();
              handleExit();
            },
            child: Image.asset(AppAssets.back, color: AppColor.text, scale: 20),
          ),
          title: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mdCtrl.teamASName.value,
                      style: tDmSans(
                        context,
                        fontWeight: FontWeight.w600,
                        fontSize: context.sp(16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                      child: Text("vs", style: stDmSans(context, fontSize: context.sp(16))),
                    ),
                    Text(
                      mdCtrl.teamBSName.value,
                      style: tDmSans(
                        context,
                        fontWeight: FontWeight.w600,
                        fontSize: context.sp(16),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: context.wp(3)),
                child: Text(mdCtrl.matchType.value, style: stDmSans(context)),
              ),
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            controller: tabController,
            labelStyle: tabLabelTextStyle(context),
            unselectedLabelStyle: tabUnLabelTextStyle(context),
            indicatorSize: TabBarIndicatorSize.label,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.symmetric(horizontal: context.wp(1)),
            indicatorColor: AppColor.sTabColor,
            dividerColor: AppColor.tDivider,
            tabs: [
              commonTab(context, title: "Match Info"),
              commonTab(context, title: "Scoreboard"),
              commonTab(context, title: "Live"),
              commonTab(context, title: "Commentary"),
              commonTab(context, title: "Playing XI"),
              commonTab(context, title: "Overs"),
              commonTab(context, title: "Point Table"),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            MatchInfo(),
            Scoreboard(),
            LmDetails(),
            Commentary(),
            PlayingXi(),
            Overs(),
            PointTable(),
          ],
        ),
        bottomNavigationBar: SafeArea(child: BannerAds()),
      ),
    );
  }

  void handleExit() {
    lmwService.disconnectSocket();
    homeCtrl.getAllMatch(silentRefresh: true);
    tourCtrl.getAllTD(tourId: tourCtrl.tourId.value, seriesId: tourCtrl.seriesId.value);
    Navigation.pop();
  }
}

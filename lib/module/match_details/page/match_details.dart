import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/page/commentary.dart';
import 'package:cricrush/module/match_details/page/lm_details.dart';
import 'package:cricrush/module/match_details/page/overs.dart';
import 'package:cricrush/module/match_details/widget/md_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchDetails extends StatefulWidget {
  const MatchDetails({super.key});

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final mdCtrl = Get.find<MatchDetailsCtrl>();

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 7, initialIndex: 2);
    callData();
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        // Interstitial.showInterstitialByCount();
      }
    });
    super.initState();
  }

  Future<void> callData() async {
    // tourWsService.disconnectSocket(clearData: false);
    final matchId = mdCtrl.matchId.value;
    await Future.wait([
      // mdCtrl.getScoreBoard(matchId),
      mdCtrl.getCommentary(matchId),
      // mdCtrl.getSquad(matchId),
      mdCtrl.getOver(matchId),
      // mdCtrl.getPointTable(mdCtrl.seriesId.value),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: CustomAppBar(
        backgroundColor: AppColor.appbarBg,
        isBackAppbar: true,
        titleSpacing: 0,
        toolbarHeight: context.hp(5),
        title: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mdCtrl.teamASName.value,
                    style: tDmSans(context, fontWeight: FontWeight.w600, fontSize: context.sp(16)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                    child: Text("vs", style: stDmSans(context, fontSize: context.sp(16))),
                  ),
                  Text(
                    mdCtrl.teamBSName.value,
                    style: tDmSans(context, fontWeight: FontWeight.w600, fontSize: context.sp(16)),
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
        children: [LmDetails(), LmDetails(), LmDetails(), Commentary(), LmDetails(), Overs(), LmDetails()],
      ),
    );
  }
}

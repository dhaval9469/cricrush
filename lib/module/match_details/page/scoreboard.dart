import 'package:cricrush/ad_module/native/medium_native.dart';
import 'package:cricrush/ad_module/native/native_banner.dart';
import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/widget/md_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/analytics_service.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Scoreboard extends StatefulWidget {
  const Scoreboard({super.key});

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  final mdCtrl = Get.find<MatchDetailsCtrl>();

  @override
  void initState() {
    AnalyticsService().logScreen('ScoreboardScreen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => mdCtrl.scoreboardLoading.value
            ? Center(child: const DL())
            : mdCtrl.scoreboardData.value?.innings?.isEmpty ?? true
            ? Center(child: ED(text: "Scoreboard not available"))
            : SmartRefresher(
                controller: mdCtrl.refreshSBCtrl,
                enablePullDown: true,
                onRefresh: () async {
                  await mdCtrl.getScoreBoard(mdCtrl.matchId.value, silentRefresh: true);
                  mdCtrl.refreshSBCtrl.refreshCompleted();
                },
                // header: CommonRefreshHeader(context),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: context.hp(1.5)),
                        itemCount: mdCtrl.scoreboardData.value?.innings?.length ?? 0,
                        itemBuilder: (context, inningIndex) {
                          final scoreboardData = mdCtrl.scoreboardData.value?.innings?[inningIndex];
                          return ExpansionTile(
                            backgroundColor: AppColor.background,
                            collapsedBackgroundColor: AppColor.card,
                            shape: Border.all(color: Colors.transparent),
                            minTileHeight: context.hp(5),
                            iconColor: AppColor.text,
                            collapsedIconColor: AppColor.text,
                            expansionAnimationStyle: const AnimationStyle(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOutCubic,
                            ),
                            tilePadding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    scoreboardData?.teamName ?? "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: tDmSans(context, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text(scoreboardData?.total ?? "", style: tDmSans(context, fontWeight: FontWeight.w600)),
                                Text("/${scoreboardData?.wickets} ", style: tDmSans(context, fontSize: context.sp(16))),
                                Text(" (${scoreboardData?.overs})", style: tDmSans(context, fontSize: context.sp(15))),
                              ],
                            ),
                            children: [
                              // Batters
                              Container(
                                decoration: BoxDecoration(color: AppColor.card),
                                child: sbBatsmanHeader(context),
                              ),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                                itemCount: scoreboardData?.batsmen?.length ?? 0,
                                itemBuilder: (context, batIndex) {
                                  final data = scoreboardData?.batsmen?[batIndex];
                                  return sbBatsmanInfo(context, data);
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return Divider(color: AppColor.tDivider, height: context.hp(2));
                                },
                              ),

                              // Extra Run
                              Padding(
                                padding: EdgeInsets.only(top: context.hp(0.5), bottom: context.hp(0.3)),
                                child: Container(
                                  color: AppColor.subCard.withValues(alpha: 0.2),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(1)),
                                    child: Row(
                                      children: [
                                        Text("Extra Runs: ", style: stBarlow(context)),
                                        const Spacer(),
                                        Text("${scoreboardData?.extra} ", style: stBarlow(context)),
                                        Row(
                                          children: [
                                            Text(
                                              "( ${scoreboardData?.byes} b, ${scoreboardData?.legbyes} lb, ${scoreboardData?.wides} wd, ${scoreboardData?.noballs} nb, ${scoreboardData?.penalty} p )",
                                              style: stBarlow(context),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              NativeBannerB(isTransparent: true, padding: EdgeInsets.only(bottom: context.hp(0.7))),

                              // Bowlers
                              Container(
                                decoration: BoxDecoration(color: AppColor.card),
                                child: sbBowlerHeader(context),
                              ),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                                itemCount: scoreboardData?.bowlers?.length ?? 0,
                                itemBuilder: (context, bolIndex) {
                                  final data = scoreboardData?.bowlers?[bolIndex];
                                  return sbBowlerInfo(context, data);
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return Divider(color: AppColor.tDivider, height: context.hp(2));
                                },
                              ),

                              NativeBannerB(isTransparent: true),
                              // Fall of Wicket
                              scoreboardData?.fallofWickets?.isEmpty ?? true
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: EdgeInsets.only(top: context.hp(1)),
                                      child: Container(
                                        decoration: BoxDecoration(color: AppColor.card),
                                        child: sbFWHeader(context),
                                      ),
                                    ),

                              scoreboardData?.fallofWickets?.isEmpty ?? true
                                  ? const SizedBox.shrink()
                                  : ListView.separated(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                                      itemCount: scoreboardData?.fallofWickets?.length ?? 0,
                                      itemBuilder: (context, ptsIndex) {
                                        final data = scoreboardData?.fallofWickets?[ptsIndex];
                                        return sbFWInfo(context, data);
                                      },
                                      separatorBuilder: (BuildContext context, int index) {
                                        return Divider(color: AppColor.tDivider, height: context.hp(2));
                                      },
                                    ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: context.hp(1));
                        },
                      ),
                      SizedBox(height: context.hp(1.5)),
                      MediumNativeB(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

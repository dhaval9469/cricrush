import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/widget/md_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Scoreboard extends StatelessWidget {
  Scoreboard({super.key});

  final mdCtrl = Get.find<MatchDetailsCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => mdCtrl.scoreboardLoading.value
            ? Center(child: const DL())
            : mdCtrl.scoreboardData.value?.innings?.isEmpty ?? true
            ? Center(child: ED(text: "Not available"))
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
                        padding: EdgeInsets.only(top: context.sp(15)),
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
                            tilePadding: EdgeInsets.symmetric(
                              horizontal: context.sp(10),
                              vertical: context.sp(3),
                            ),
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
                                Text(
                                  scoreboardData?.total ?? "",
                                  style: tDmSans(context, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "/${scoreboardData?.wickets} ",
                                  style: tDmSans(context, fontSize: context.sp(16)),
                                ),
                                Text(
                                  " (${scoreboardData?.overs})",
                                  style: tDmSans(context, fontSize: context.sp(15)),
                                ),
                              ],
                            ),
                            children: [
                              Container(
                                decoration: BoxDecoration(color: AppColor.card),
                                child: sbBatsmanHeader(context),
                              ),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(vertical: context.sp(15)),
                                itemCount: scoreboardData?.batsmen?.length ?? 0,
                                itemBuilder: (context, batIndex) {
                                  final data = scoreboardData?.batsmen?[batIndex];
                                  return sbBatsmanInfo(context, data);
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return Divider(color: AppColor.tDivider, height: context.hp(2));
                                },
                              ),
                              Container(
                                decoration: BoxDecoration(color: AppColor.subCard),
                                child: sbBatsmanHeader(context),
                              ),

                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: context.hp(1.5));
                        },
                      ),
                      SizedBox(height: context.hp(1.5)),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

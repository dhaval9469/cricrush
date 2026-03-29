import 'package:cricrush/ad_module/native/small_native.dart';
import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/model/lmw_model.dart';
import 'package:cricrush/module/match_details/service/lmw_ser.dart';
import 'package:cricrush/module/match_details/widget/md_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/time_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LmdUpcoming extends StatelessWidget {
  final WSLSDetailsModel? data;

  LmdUpcoming({super.key, this.data});

  final mdCtrl = Get.find<MatchDetailsCtrl>();
  final lmwService = Get.find<LMWService>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.hp(1.5)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.tDivider, width: 2.5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: context.hp(2)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              showFlag(context: context, url: data?.team1Image ?? "", w: context.wp(2), h: context.wp(2)),
                              SizedBox(width: context.wp(3)),
                              Text(
                                "${data?.team1NameSort}",
                                style: tDmSans(context, fontSize: context.sp(17), fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${data?.team2NameSort}",
                                style: tDmSans(context, fontSize: context.sp(17), fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: context.wp(3)),
                              showFlag(context: context, url: data?.team2Image ?? "", w: context.wp(2), h: context.wp(2)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.hp(2)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
                      child: data?.tosswonby != null
                          ? Text(
                              "${data?.tosswonby} won the toss and chose to ${data?.tossElectedTo} ${data?.tossElectedTo == 'bat' ? '🏏' : '🥎'} first",
                              textAlign: TextAlign.center,
                              style: stDmSans(context, fontSize: context.sp(16), fontWeight: FontWeight.w600),
                            )
                          : Text(
                              "Starting at  ${TimeManager.convertUtcToLocal(data?.startDate ?? '')}",
                              style: stDmSans(context, fontSize: context.sp(16), fontWeight: FontWeight.w600),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SmallNativeB(
            padding: EdgeInsets.only(top: context.hp(1.3), right: context.wp(3), left: context.wp(3)),
            radius: 12,
          ),

          Obx(() {
            final matchInfo = mdCtrl.scoreboardData.value?.matchdetail;
            return matchInfo?.venue == null
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(left: context.wp(3), right: context.wp(3), top: context.hp(1.7)),
                    child: Container(
                      decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: context.hp(1), horizontal: context.wp(2.5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            matchUC(context, header: "Series", text: matchInfo?.series ?? ""),
                            SizedBox(height: context.hp(0.3)),
                            matchUC(
                              context,
                              header: "Weather",
                              text: (matchInfo?.venue?.venueWeather?.weather?.isNotEmpty ?? false)
                                  ? matchInfo?.venue?.venueWeather?.weather
                                  : "-",
                            ),
                            SizedBox(height: context.hp(0.3)),
                            matchUC(
                              context,
                              header: "Venue",
                              text: (matchInfo?.venue?.name?.isNotEmpty ?? false) ? matchInfo?.venue?.name : "-",
                            ),

                            SizedBox(height: context.hp(0.3)),
                            matchUC(
                              context,
                              header: "Umpire",
                              text: (matchInfo?.umpires?.isNotEmpty ?? false) ? matchInfo?.umpires : '-',
                            ),

                            SizedBox(height: context.hp(0.3)),
                            matchUC(
                              context,
                              header: "Referee",
                              text: (matchInfo?.referee?.isNotEmpty ?? false) ? matchInfo?.referee : "-",
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          }),

          data?.matches?.isEmpty ?? true
              ? SizedBox()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: context.wp(4), bottom: context.hp(0.5), top: context.hp(1.7)),
                      child: Text(
                        "Next Matches",
                        style: stDmSans(context, color: AppColor.text, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                      itemCount: data?.matches?.length ?? 0,
                      itemBuilder: (context, index) {
                        final matchData = data?.matches?[index];
                        return nextUpCoMatch(context, matchData);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: context.hp(1.3));
                      },
                    ),
                  ],
                ),

          data?.matchesFinal?.isEmpty ?? true
              ? SizedBox()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: context.wp(4), bottom: context.hp(0.5), top: context.hp(1.3)),
                      child: Text(
                        "Completed Matches",
                        style: stDmSans(context, color: AppColor.text, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                      itemCount: data?.matchesFinal?.length ?? 0,
                      itemBuilder: (context, index) {
                        final matchData = data?.matchesFinal?[index];
                        return finishMatch(context, matchData);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: context.hp(1.3));
                      },
                    ),
                  ],
                ),
          SizedBox(height: context.hp(1.5)),
        ],
      ),
    );
  }
}

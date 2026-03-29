import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/home/model/all_match_model.dart';
import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/service/lmw_ser.dart';
import 'package:cricrush/module/schedule/widget/schedual_widget.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SUpcomingTab extends StatefulWidget {
  const SUpcomingTab({super.key});

  @override
  State<SUpcomingTab> createState() => _SUpcomingTabState();
}

class _SUpcomingTabState extends State<SUpcomingTab> {
  final homeCtrl = Get.find<HomeCtrl>();
  final tourCtrl = Get.find<ToursCtrl>();
  final lmwService = Get.find<LMWService>();
  final mdCtrl = Get.find<MatchDetailsCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(1.3)),
            child: Row(
              children: homeCtrl.matchTypes.map((e) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(1.5)),
                  child: GestureDetector(
                    onTap: () {
                      Interstitial.showInterstitialByCount();

                      homeCtrl.usMatchTypes.value = e.mt ?? "";
                      homeCtrl.upSeriesData.clear();

                      for (var element in homeCtrl.allUSData) {
                        List<UCSeriesData> upcomingMatches = [];

                        element.upcoming?.forEach((mEle) {
                          final matchType = mEle.matchtype?.toLowerCase() ?? "";

                          if (e.mtList!.contains('all') || e.mtList!.contains(matchType)) {
                            upcomingMatches.add(element);
                          }
                        });

                        if (upcomingMatches.isNotEmpty) {
                          homeCtrl.upSeriesData.addAll(upcomingMatches);
                        }
                      }
                    },
                    child: Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(vertical: context.hp(0.7)),
                        width: context.wp(18),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: homeCtrl.usMatchTypes.value == e.mt ? AppColor.sTabColor : AppColor.card,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: homeCtrl.usMatchTypes.value == e.mt ? AppColor.sTabColor : AppColor.tDivider),
                        ),
                        child: Text(
                          "${e.mt}",
                          style: stDmSans(
                            context,
                            height: 0.9,
                            color: homeCtrl.usMatchTypes.value == e.mt ? AppColor.text : AppColor.subText,
                          ),
                          strutStyle: const StrutStyle(height: 1, forceStrutHeight: true),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Obx(
              () => homeCtrl.allML.value
                  ? Center(child: const DL())
                  : homeCtrl.upSeriesData.isEmpty
                  ? Center(child: ED(text: "No upcoming matches scheduled"))
                  : ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: context.hp(0.3), bottom: context.hp(3)),
                      itemCount: homeCtrl.upSeriesData.length,
                      itemBuilder: (context, seriesIndex) {
                        final data = homeCtrl.upSeriesData[seriesIndex];
                        return Container(
                          decoration: BoxDecoration(color: AppColor.card),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color: AppColor.cDivider, height: 0),
                              mcHeader(context: context, tourName: "${data.tourName?.replaceAll(",", " ")}"),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: (data.upcoming?.length ?? 0) > 3 ? 3 : (data.upcoming?.length ?? 0),
                                itemBuilder: (context, index) {
                                  final matchData = data.upcoming?[index];

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Interstitial.showInterstitialByCount();

                                          mdCtrl.seriesId.value = data.seriesId ?? "";
                                          mdCtrl.tourId.value = data.tourId ?? "";
                                          passUpCData(matchData);
                                          Navigation.pushNamed(Routes.matchDetails);
                                          lmwService.getLSDFUR(matchData?.matchfile ?? "");
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(1.2)),
                                          child: sUpComing(context: context, data: matchData),
                                        ),
                                      ),
                                      // seriesIndex == 0 && index == 0
                                      //     ? NativeBannerD(height: 65, isSecond: false, isDividerHeight: 1)
                                      //     : const SizedBox.shrink(),
                                    ],
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                                    child: Divider(color: AppColor.cDivider, height: context.hp(0.5)),
                                  );
                                  // return
                                  //   Padding(
                                  //   padding: seriesIndex == 0 && index == 0
                                  //       ? EdgeInsets.zero
                                  //       : EdgeInsets.symmetric(horizontal: context.wp(3)),
                                  //   child: Divider(color: AppColor.cDivider, height: context.hp(0.5)),
                                  // );
                                },
                              ),
                              Divider(color: AppColor.cDivider, height: 0),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: context.hp(1.2));
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void passUpCData(MTUpComingMatch? data) {
    mdCtrl.matchId.value = data?.matchfile ?? "";
    mdCtrl.matchType.value = data?.matchnumber ?? "";
    mdCtrl.teamAFlag.value = data?.teamaImage ?? "";
    mdCtrl.teamBFlag.value = data?.teambImage ?? "";
    mdCtrl.teamAName.value = data?.teama ?? "";
    mdCtrl.teamBName.value = data?.teamb ?? "";
    mdCtrl.teamASName.value = data?.teamaShort ?? "";
    mdCtrl.teamBSName.value = data?.teambShort ?? "";
  }
}

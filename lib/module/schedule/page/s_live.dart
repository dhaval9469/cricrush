import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/ad_module/native/native_banner.dart';
import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/home/model/all_match_model.dart';
import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/service/lmw_ser.dart';
import 'package:cricrush/module/schedule/widget/schedual_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SLiveTab extends StatelessWidget {
  SLiveTab({super.key});

  final homeCtrl = Get.find<HomeCtrl>();
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
                      homeCtrl.lsMatchTypes.value = e.mt ?? "";
                      homeCtrl.liveSeriesData.clear();

                      for (var element in homeCtrl.allLSData) {
                        List<LiveSeriesData> upcomingMatches = [];

                        element.live?.forEach((mEle) {
                          final matchType = mEle.matchdetail?.match?.type?.toLowerCase() ?? "";

                          if (e.mtList!.contains('all') || e.mtList!.contains(matchType)) {
                            upcomingMatches.add(element);
                          }
                        });

                        if (upcomingMatches.isNotEmpty) {
                          homeCtrl.liveSeriesData.addAll(upcomingMatches);
                        }
                      }
                    },
                    child: Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(vertical: context.hp(0.7)),
                        width: context.wp(18),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: homeCtrl.lsMatchTypes.value == e.mt ? AppColor.sTabColor : AppColor.card,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: homeCtrl.lsMatchTypes.value == e.mt ? AppColor.sTabColor : AppColor.tDivider),
                        ),
                        child: Text(
                          "${e.mt}",
                          style: stDmSans(
                            context,
                            height: 0.9,
                            color: homeCtrl.lsMatchTypes.value == e.mt ? AppColor.text : AppColor.subText,
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
                  : homeCtrl.liveSeriesData.isEmpty
                  ? Center(child: ED(text: "No live matches right now"))
                  : ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: context.hp(0.3), bottom: context.hp(3)),
                      itemCount: homeCtrl.liveSeriesData.length,
                      itemBuilder: (context, seriesIndex) {
                        final data = homeCtrl.liveSeriesData[seriesIndex];
                        return Container(
                          decoration: BoxDecoration(color: AppColor.card),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color: AppColor.cDivider, height: 0),
                              mcHeader(context: context, tourName: "${data.tourName}"),
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: data.live?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final matchData = data.live?[index];
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          Interstitial.showInterstitialByCount();

                                          mdCtrl.seriesId.value = data.seriesId ?? "";
                                          mdCtrl.tourId.value = data.tourId ?? "";
                                          passLiveData(matchData);
                                          Navigation.pushNamed(Routes.matchDetails);
                                          lmwService.openMatch(matchData?.matchdetail?.match?.code ?? "");
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(1)),
                                          child: sLive(context: context, data: matchData),
                                        ),
                                      ),
                                      seriesIndex == 0 && index == 0
                                          ? NativeBannerD(height: 65, isSecond: false, isDividerHeight: 1)
                                          : const SizedBox.shrink(),
                                    ],
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: seriesIndex == 0 && index == 0
                                        ? EdgeInsets.zero
                                        : EdgeInsets.symmetric(horizontal: context.wp(3)),
                                    child: Divider(color: AppColor.cDivider, height: context.hp(0.5)),
                                  );
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

  void passLiveData(MTLiveMatch? data) {
    mdCtrl.matchId.value = data?.matchdetail?.match?.code ?? "";
    mdCtrl.matchType.value = data?.matchdetail?.match?.number ?? "";
    mdCtrl.teamAFlag.value = data?.teamlist?[0].teamImage ?? "";
    mdCtrl.teamBFlag.value = data?.teamlist?[1].teamImage ?? "";
    mdCtrl.teamAName.value = data?.teamlist?[0].nameFull ?? "";
    mdCtrl.teamBName.value = data?.teamlist?[1].nameFull ?? "";
    mdCtrl.teamASName.value = data?.teamlist?[0].nameShort ?? "";
    mdCtrl.teamBSName.value = data?.teamlist?[1].nameShort ?? "";
  }
}

import 'package:cricrush/ad_module/interstitial_ad.dart';
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

class SResultTab extends StatefulWidget {
  const SResultTab({super.key});

  @override
  State<SResultTab> createState() => _SResultTabState();
}

class _SResultTabState extends State<SResultTab> {
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

                      homeCtrl.rsMatchTypes.value = e.mt ?? "";
                      homeCtrl.rSeriesData.clear();

                      for (var element in homeCtrl.allRSData) {
                        List<RSeriesData> upcomingMatches = [];

                        element.results?.forEach((mEle) {
                          final matchType = mEle.matchdetail?.match?.type?.toLowerCase() ?? "";

                          if (e.mtList!.contains('all') || e.mtList!.contains(matchType)) {
                            upcomingMatches.add(element);
                          }
                        });

                        if (upcomingMatches.isNotEmpty) {
                          homeCtrl.rSeriesData.addAll(upcomingMatches);
                        }
                      }
                    },
                    child: Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(vertical: context.hp(0.7)),
                        width: context.wp(18),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: homeCtrl.rsMatchTypes.value == e.mt ? AppColor.sTabColor : AppColor.card,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: homeCtrl.rsMatchTypes.value == e.mt ? AppColor.sTabColor : AppColor.tDivider),
                        ),
                        child: Text(
                          "${e.mt}",
                          style: stDmSans(
                            context,
                            height: 0.9,
                            color: homeCtrl.rsMatchTypes.value == e.mt ? AppColor.text : AppColor.subText,
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
                  : homeCtrl.rSeriesData.isEmpty
                  ? Center(child: ED(text: "No completed matches found"))
                  : ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: context.hp(0.3), bottom: context.hp(3)),
                      itemCount: homeCtrl.rSeriesData.length,
                      itemBuilder: (context, seriesIndex) {
                        final data = homeCtrl.rSeriesData[seriesIndex];
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
                                padding: EdgeInsets.symmetric(vertical: context.hp(2)),
                                itemCount: (data.results?.length ?? 0) > 3 ? 3 : (data.results?.length ?? 0),
                                itemBuilder: (context, index) {
                                  final matchData = data.results?[index];

                                  return padding(
                                    context,
                                    isHorizontal: true,
                                    Column(
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
                                          child: sFinish(context: context, data: matchData),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return padding(
                                    context,
                                    isHorizontal: true,
                                    Divider(color: AppColor.cDivider, height: context.hp(2.3)),
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

  void passLiveData(MTResultsMatch? data) {
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

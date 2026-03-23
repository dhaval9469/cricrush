import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/home/model/all_match_model.dart';
import 'package:cricrush/module/schedule/widget/schedual_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SLiveTab extends StatelessWidget {
  SLiveTab({super.key});

  final homeCtrl = Get.find<HomeCtrl>();

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
                        padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(0.6)),
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
                  ? Center(child: ED(text: "Match Not Found"))
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: context.hp(1.5)),
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
                              ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(vertical: context.hp(1.3)),
                                itemCount: data.live?.length,
                                itemBuilder: (context, index) {
                                  final matchData = data.live?[index];
                                  return padding(
                                    context,
                                    isHorizontal: true,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [sLive(context: context, data: matchData)],
                                    ),
                                  );
                                },
                              ),
                              Divider(color: AppColor.cDivider, height: 0),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

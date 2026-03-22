import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
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
      body: Obx(
        () => homeCtrl.allNSSL.value
            ? Center(child: const DL())
            : homeCtrl.liveSeriesData.isEmpty
            ? Center(child: ED(text: "Match Not Found"))
            : ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: context.hp(1.3)),
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
    );
  }
}

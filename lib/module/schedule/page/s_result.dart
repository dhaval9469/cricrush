import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/schedule/widget/schedual_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            padding(context, Row(children: [])),
            Obx(
              () => homeCtrl.allNSSL.value
                  ? Center(child: const DL())
                  : homeCtrl.rSeriesData.isEmpty
                  ? Center(child: ED(text: "Match Not Found"))
                  : ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: context.hp(1.5)),
                      physics: NeverScrollableScrollPhysics(),
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
                                padding: EdgeInsets.symmetric(vertical: context.hp(2)),
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: (data.results?.length ?? 0) > 3 ? 3 : (data.results?.length ?? 0),
                                itemBuilder: (context, index) {
                                  final matchData = data.results?[index];

                                  return padding(
                                    context,
                                    isHorizontal: true,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [sFinish(context: context, data: matchData)],
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
          ],
        ),
      ),
    );
  }
}

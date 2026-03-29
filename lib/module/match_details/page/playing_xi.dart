import 'package:cricrush/ad_module/native/native_banner.dart';
import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/analytics_service.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayingXi extends StatefulWidget {
  const PlayingXi({super.key});

  @override
  State<PlayingXi> createState() => _PlayingXiState();
}

class _PlayingXiState extends State<PlayingXi> {
  final mdCtrl = Get.find<MatchDetailsCtrl>();

  @override
  void initState() {
    AnalyticsService().logScreen('PlayingXiScreen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => mdCtrl.squadLoading.value
            ? Center(child: const DL())
            : (mdCtrl.squadData.value?.teamsNew?[0].players?.isEmpty ?? false)
            ? Center(child: ED(text: "Playing XI not available"))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              mdCtrl.isSquad.value = 0;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: mdCtrl.isSquad.value == 0 ? AppColor.card : AppColor.background),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: context.hp(1.3)),
                                child: Text(
                                  mdCtrl.teamASName.value,
                                  style: tBarlow(
                                    context,
                                    color: mdCtrl.isSquad.value == 0 ? AppColor.text : AppColor.subText,
                                    fontWeight: mdCtrl.isSquad.value == 0 ? FontWeight.bold : FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              mdCtrl.isSquad.value = 1;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: mdCtrl.isSquad.value == 1 ? AppColor.card : AppColor.background),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: context.hp(1.3)),
                                child: Text(
                                  mdCtrl.teamBSName.value,
                                  style: tBarlow(
                                    context,
                                    color: mdCtrl.isSquad.value == 1 ? AppColor.text : AppColor.subText,
                                    fontWeight: mdCtrl.isSquad.value == 1 ? FontWeight.bold : FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColor.cDivider, height: 0),
                    NativeBannerB(padding: EdgeInsets.only(top: context.hp(1))),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: context.hp(2), horizontal: context.wp(3)),
                      shrinkWrap: true,
                      itemCount: mdCtrl.squadData.value?.teamsNew?[mdCtrl.isSquad.value].players?.length ?? 0,
                      itemBuilder: (context, batIndex) {
                        final data = mdCtrl.squadData.value?.teamsNew?[mdCtrl.isSquad.value].players?[batIndex];
                        return Expanded(
                          child: Row(
                            children: [
                              showPlayer(context: context, url: data?.image ?? "", h: context.wp(2), w: context.wp(2)),
                              SizedBox(width: context.wp(5)),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${data?.nameFull?.trim()}", style: tBarlow(context, fontSize: context.sp(14))),
                                          SizedBox(height: context.hp(0.2)),
                                          Text(data?.role ?? "", style: stBarlow(context, fontSize: context.sp(12))),
                                        ],
                                      ),
                                    ),

                                    data?.iscaptain == true
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF363B49),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: AppColor.tDivider),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: context.wp(2), vertical: context.hp(0.7)),
                                              child: Text(
                                                data?.iscaptain == true ? "C" : "vc",
                                                style: tBarlow(context, fontSize: context.sp(16), fontWeight: FontWeight.bold),
                                                strutStyle: const StrutStyle(height: 1, forceStrutHeight: true),
                                              ),
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    SizedBox(width: context.wp(3)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(indent: context.wp(14), height: context.hp(2), color: AppColor.tDivider);
                      },
                    ),

                    SizedBox(height: context.hp(5)),
                  ],
                ),
              ),
      ),
    );
  }
}

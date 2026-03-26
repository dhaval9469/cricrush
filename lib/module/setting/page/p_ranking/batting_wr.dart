import 'package:cricrush/module/setting/ctrl/setting_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BattingWr extends StatefulWidget {
  const BattingWr({super.key});

  @override
  State<BattingWr> createState() => _AllRounderMrState();
}

class _AllRounderMrState extends State<BattingWr> {
  final setting = Get.find<SettingCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackAppbar: true,
        backgroundColor: AppColor.card,
        toolbarHeight: context.hp(5),
        title: Text(
          "Batting Ranking",
          style: tDmSans(context, fontSize: context.sp(17), fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          SizedBox(height: context.hp(1.5)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                formatTab(
                  context: context,
                  onTap: () {
                    setting.battingWRF.value = 1;
                    setting.iccWomenBatsmenRList.value = setting.allRankingModel.value?.women?[1].t20w?.bat ?? [];
                  },
                  title: "T20",
                  value: 1,
                  selectedValue: setting.battingWRF,
                ),
                SizedBox(width: context.wp(7)),
                formatTab(
                  context: context,
                  onTap: () {
                    setting.battingWRF.value = 2;
                    setting.iccWomenBatsmenRList.value = setting.allRankingModel.value?.women?[0].odiw?.bat ?? [];
                  },
                  title: "ODI",
                  value: 2,
                  selectedValue: setting.battingWRF,
                ),
              ],
            ),
          ),
          SizedBox(height: context.hp(1.5)),
          Container(
            decoration: BoxDecoration(color: AppColor.card),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: context.hp(1), horizontal: context.wp(3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Players", style: scHeaderStyle(context)),
                  Text("Points", style: scHeaderStyle(context)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => setting.isAllRanking.value
                  ? Center(child: const DL())
                  : ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: context.hp(1.5), horizontal: context.wp(3)),
                      itemCount: setting.iccWomenBatsmenRList.length,
                      itemBuilder: (context, index) {
                        final data = setting.iccWomenBatsmenRList[index];
                        return Row(
                          children: [
                            showPlayer(context: context, url: data.image ?? "", h: context.wp(2.5), w: context.wp(2.5)),
                            SizedBox(width: context.wp(5)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${data.playerName}", style: tBarlow(context, fontSize: context.sp(14))),
                                Text("${data.teamName}", style: stBarlow(context, fontSize: context.sp(12))),
                              ],
                            ),
                            Spacer(),
                            Text(
                              "${data.points?.trim()}",
                              style: tBarlow(context, fontSize: context.sp(16), fontWeight: FontWeight.w600),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(color: AppColor.tDivider, height: context.hp(3));
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget formatTab({
    required BuildContext context,
    GestureTapCallback? onTap,
    required String title,
    required int value,
    required RxInt selectedValue,
  }) {
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: context.hp(0.8)),
          width: context.wp(25),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selectedValue.value == value ? AppColor.sTabColor : AppColor.card,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: selectedValue.value == value ? AppColor.sTabColor : AppColor.tDivider),
          ),
          child: Text(
            title,
            style: stDmSans(
              context,
              fontWeight: selectedValue.value == value ? FontWeight.bold : FontWeight.w500,
              color: selectedValue.value == value ? AppColor.text : AppColor.subText,
            ),
            strutStyle: const StrutStyle(height: 1, forceStrutHeight: true),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    setting.battingWRF.value = 1;
    super.dispose();
  }
}

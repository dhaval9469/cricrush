import 'package:cricrush/module/setting/ctrl/setting_ctrl.dart';
import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class PlayerRanking extends StatelessWidget {
  PlayerRanking({super.key});

  final setting = Get.find<SettingCtrl>()..getAllRanking();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackAppbar: true,
        backgroundColor: AppColor.card,
        toolbarHeight: context.hp(5),
        title: Text(
          "Player Ranking",
          style: tDmSans(context, fontSize: context.sp(17), fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          SizedBox(height: context.hp(1.5)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.subCard.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.tDivider),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.card,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                      child: ranking(context, icon: Iconsax.man_copy, text: "ICC Man's Ranking", isBold: true),
                    ),
                  ),
                  Divider(color: AppColor.tDivider, height: 0),
                  SizedBox(height: context.hp(1)),
                  ranking(
                    context,
                    assetName: AppAssets.rBat,
                    onTap: () {
                      Navigation.pushNamed(Routes.battingMR);
                    },
                    text: "Batting Ranking",
                  ),
                  SizedBox(height: context.hp(1)),
                  ranking(
                    context,
                    assetName: AppAssets.rAllR,
                    onTap: () {
                      Navigation.pushNamed(Routes.allRounderMr);
                    },
                    text: "All-Rounder Ranking",
                  ),
                  SizedBox(height: context.hp(1)),
                  ranking(
                    context,
                    assetName: AppAssets.rBall,
                    icon: Iconsax.flash_1,
                    onTap: () {
                      Navigation.pushNamed(Routes.bowlingMR);
                    },
                    text: "Bowling Ranking",
                  ),

                  SizedBox(height: context.hp(1.2)),
                ],
              ),
            ),
          ),
          SizedBox(height: context.hp(1.5)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.subCard.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.tDivider),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.card,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                      child: ranking(context, icon: Iconsax.woman_copy, text: "ICC Women’s PlayerRanking", isBold: true),
                    ),
                  ),
                  Divider(color: AppColor.tDivider, height: 0),
                  SizedBox(height: context.hp(1)),
                  ranking(
                    context,
                    assetName: AppAssets.rBat,
                    onTap: () {
                      Navigation.pushNamed(Routes.battingWr);
                    },
                    text: "Batting Ranking",
                  ),
                  SizedBox(height: context.hp(1)),
                  ranking(
                    context,
                    assetName: AppAssets.rAllR,
                    onTap: () {
                      Navigation.pushNamed(Routes.allRounderWr);
                    },
                    text: "All-Rounder Ranking",
                  ),
                  SizedBox(height: context.hp(1)),
                  ranking(
                    context,
                    assetName: AppAssets.rBall,
                    onTap: () {
                      Navigation.pushNamed(Routes.bowlingWr);
                    },
                    text: "Bowling Ranking",
                  ),

                  SizedBox(height: context.hp(1.2)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ranking(
    BuildContext context, {
    String? text,
    IconData? icon,
    String? assetName,
    bool isBold = false,
    GestureTapCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
        child: Row(
          children: [
            isBold == true
                ? Icon(icon, color: AppColor.white, size: context.sp(20))
                : SvgPicture.asset(
                    assetName ?? "",
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    height: context.sp(16),
                  ),
            SizedBox(width: context.wp(4)),
            Text(
              "$text",
              style: isBold == true ? tDmSans(context, fontWeight: FontWeight.bold) : stBarlow(context, fontSize: context.sp(15)),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: isBold == true ? Colors.transparent : AppColor.subText,
              size: isBold == true ? context.sp(0) : context.sp(15),
            ),
          ],
        ),
      ),
    );
  }
}

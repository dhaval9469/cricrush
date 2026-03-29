import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/ad_module/native/big_native.dart';
import 'package:cricrush/ad_module/native/medium_native.dart';
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

class TeamRanking extends StatelessWidget {
  TeamRanking({super.key});

  final setting = Get.find<SettingCtrl>()..getAllRanking();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) return;
        Interstitial.showInterstitialByBackCount();
        Navigation.pop();
      },
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: CustomAppBar(
          isBackAppbar: true,
          backgroundColor: AppColor.card,
          toolbarHeight: context.hp(5),
          title: Text(
            "Team Ranking",
            style: tDmSans(context, fontSize: context.sp(17), fontWeight: FontWeight.bold),
          ),
        ),
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
                    SizedBox(height: context.hp(1.2)),
                    ranking(
                      context,
                      assetName: AppAssets.rTeam,
                      onTap: () {
                        Interstitial.showInterstitialByCount();
                        Navigation.pushNamed(Routes.teamMR);
                      },
                      text: "Man's Team Ranking",
                    ),
                    SizedBox(height: context.hp(1.4)),
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
                    SizedBox(height: context.hp(1.2)),
                    ranking(
                      context,
                      assetName: AppAssets.rTeam,
                      onTap: () {
                        Interstitial.showInterstitialByCount();
                        Navigation.pushNamed(Routes.teamWr);
                      },
                      text: "Woman's Team Ranking",
                    ),
                    SizedBox(height: context.hp(1.4)),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.hp(5)),
            FullNativeBAd(),
          ],
        ),
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
              style: isBold == true ? tDmSans(context, fontWeight: FontWeight.bold) : stBarlow(context, fontSize: context.sp(16)),
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

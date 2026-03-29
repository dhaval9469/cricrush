import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/ad_module/native/native_banner.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TKeyState extends StatelessWidget {
  TKeyState({super.key});

  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => tourCtrl.tDL.value
            ? Center(child: const DL())
            : tourCtrl.tKeyStatsList.isEmpty
            ? Center(child: const ED(text: "Key stats not available"))
            : ListView.separated(
                shrinkWrap: true,
                itemCount: tourCtrl.tKeyStatsList.length,
                padding: EdgeInsets.only(top: context.hp(1), bottom: context.hp(3)),
                itemBuilder: (context, index) {
                  final data = tourCtrl.tKeyStatsList[index];
                  return GestureDetector(
                    onTap: () {
                      Interstitial.showInterstitialByCount();
                      Navigation.pushNamed(Routes.playerState, arg: data);
                    },
                    child: Container(
                      decoration: BoxDecoration(color: AppColor.card),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.wp(3),
                          vertical: context.hp(1.3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${data.displayName}",
                              style: tBarlow(context, fontWeight: FontWeight.w600),
                              strutStyle: const StrutStyle(height: 1, forceStrutHeight: true),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: AppColor.subText,
                              size: context.sp(15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? NativeBannerB(padding: EdgeInsets.symmetric(vertical: context.hp(0.6)))
                      : SizedBox(height: context.hp(0.7));
                },
              ),
      ),
    );
  }
}

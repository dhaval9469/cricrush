import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/module/home/ctrl/sorts_ctrl.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MustWatch extends StatelessWidget {
  MustWatch({super.key});

  final tourCtrl = Get.find<ToursCtrl>();
  final sortsCtrl = Get.find<SortsCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => tourCtrl.allNSSL.value
          ? SizedBox(
              height: context.hp(25),
              child: Center(child: const DL()),
            )
          : tourCtrl.shortsList.isEmpty
          ? SizedBox.shrink()
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: context.wp(4),
                    right: context.wp(2),
                    bottom: context.hp(1),
                    top: context.hp(1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Must Watch", style: tDmSans(context, fontWeight: FontWeight.w600)),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Interstitial.showInterstitialByCount();
                          sortsCtrl.sortIndex.value = 0;
                          sortsCtrl.shortsList = tourCtrl.shortsList;
                          Navigation.pushNamed(Routes.sortsPage);
                        },
                        child: Text("See All", style: stDmSans(context, fontSize: context.sp(13))),
                      ),
                      SizedBox(width: context.sp(1)),
                      Icon(Icons.arrow_forward_ios, color: AppColor.subText, size: context.sp(11)),
                    ],
                  ),
                ),

                SizedBox(
                  height: context.hp(25),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
                    itemCount: tourCtrl.shortsList.length,
                    itemBuilder: (context, index) {
                      final data = tourCtrl.shortsList[index];
                      return data.adsShow == 1
                          ? SizedBox.shrink()
                          : GestureDetector(
                              onTap: () {
                                Interstitial.showInterstitialByCount();
                                sortsCtrl.sortIndex.value = index;
                                sortsCtrl.shortsList = tourCtrl.shortsList;
                                Navigation.pushNamed(Routes.sortsPage);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  data.image2 ?? "",
                                  height: context.hp(25),
                                  width: context.wp(40),
                                  fit: BoxFit.fill,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return SizedBox(
                                        height: context.hp(25),
                                        width: context.wp(40),
                                        child: shortsShimmer(context),
                                      );
                                    }
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset("", fit: BoxFit.cover, height: context.hp(25), width: context.wp(40));
                                  },
                                ),
                              ),
                            );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: context.wp(3));
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget shortsShimmer(BuildContext context) {
    final baseColor = const Color(0xFF2A2F3A);
    final highlightColor = const Color(0xFF3A4250);

    return Container(
      height: context.hp(25),
      width: context.wp(40),
      decoration: BoxDecoration(color: AppColor.background, borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(color: const Color(0xFF2A2F3A)),
        ),
      ),
    );
  }
}

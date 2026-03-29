import 'dart:math';

import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/time_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TONews extends StatelessWidget {
  TONews({super.key});

  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => tourCtrl.newsList.isEmpty
          ? const SizedBox.shrink()
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: context.wp(4), bottom: context.hp(1), top: context.hp(1.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Top Store", style: tDmSans(context, fontWeight: FontWeight.w600)),
                      // Spacer(),
                      // SizedBox(width: context.wp(1),),
                      // Icon(Icons.arrow_forward_ios,color: AppColor.subText,size: context.sp(13),),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  itemCount: min(3, tourCtrl.newsList.length),
                  itemBuilder: (context, index) {
                    final data = tourCtrl.newsList[index];
                    return GestureDetector(
                      onTap: () {
                        Interstitial.showInterstitialByCount();
                        tourCtrl.newsTitle.value = data.title.toString();
                        tourCtrl.newsDescription.value = data.description ?? "";
                        tourCtrl.newsURLToImage.value = data.image.toString();
                        tourCtrl.publishedAT.value = data.dateTime.toString();
                        tourCtrl.newsIndex.value = index;
                        Navigation.pushNamed(Routes.newsDetails);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColor.cDivider.withValues(alpha: 0.5)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: context.hp(1), horizontal: context.wp(2)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: data.image ?? "defaultHeroTag",
                                child: showPlayer(
                                  context: context,
                                  url: data.image ?? "",
                                  h: context.wp(12),
                                  w: context.wp(25),
                                  r: 10,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(vertical: context.hp(0.7)),
                                child: Text(
                                  "${data.title}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: tDmSans(context, fontSize: context.sp(14)),
                                ),
                              ),
                              Text(
                                TimeManager.newsTimeTO(data.dateTime ?? ""),
                                style: stBarlow(context, fontSize: context.sp(12)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: context.hp(2));
                  },
                ),
              ],
            ),
    );
  }
}

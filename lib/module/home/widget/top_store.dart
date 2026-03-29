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

class TopStore extends StatelessWidget {
  TopStore({super.key});

  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => tourCtrl.newsList.isEmpty
          ? SizedBox.shrink()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: context.wp(4), bottom: context.hp(1), top: context.hp(1.5)),
                  child: Text("Top Store", style: tDmSans(context, fontWeight: FontWeight.w600)),
                ),

                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  itemCount: tourCtrl.newsList.length,
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
                      child: Row(
                        children: [
                          Hero(
                            tag: data.image ?? "defaultHeroTag",
                            child: showPlayer(context: context, url: data.image ?? "", h: context.wp(4.5), w: context.wp(7), r: 4),
                          ),
                          SizedBox(width: context.wp(4)),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${data.title}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: tBarlow(context, fontSize: context.sp(13)),
                                ),
                                SizedBox(height: context.hp(0.5)),
                                Text(
                                  TimeManager.setNewsTime(data.dateTime ?? ""),
                                  style: stDmSans(context, fontSize: context.sp(12)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(height: context.hp(2), color: AppColor.cDivider.withValues(alpha: 0.5));
                  },
                ),
              ],
            ),
    );
  }
}

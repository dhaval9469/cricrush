import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:cricrush/widget/time_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TNews extends StatelessWidget {
  TNews({super.key});

  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => tourCtrl.tDL.value
            ? Center(child: const DL())
            : tourCtrl.newsList.isEmpty
            ? Center(child: const ED(text: "Matches Not Found"))
            : ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: context.hp(1), bottom: context.hp(3), right: context.wp(3), left: context.wp(3)),
                itemCount: tourCtrl.newsList.length,
                itemBuilder: (context, index) {
                  final data = tourCtrl.newsList[index];
                  return GestureDetector(
                    onTap: () {
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
                          child: showPlayer(context: context, url: data.image ?? "", h: context.wp(4), w: context.wp(6), r: 4),
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
      ),
    );
  }
}

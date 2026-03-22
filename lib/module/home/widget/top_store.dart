import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/time_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopStore extends StatelessWidget {
  TopStore({super.key});

  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.allNSSL.value
          ? CircularProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: context.wp(5),
                    bottom: context.hp(1.5),
                    top: context.hp(2.5),
                  ),
                  child: Text(
                    "Top Store",
                    style: stDmSans(context, color: AppColor.text, fontWeight: FontWeight.w600),
                  ),
                ),

                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  itemCount: homeCtrl.newsList.length,
                  itemBuilder: (context, index) {
                    final data = homeCtrl.newsList[index];
                    return Row(
                      children: [
                        showPlayer(
                          context: context,
                          url: data.image ?? "",
                          h: context.wp(4),
                          w: context.wp(6),
                          r: 4,
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
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: context.hp(2),
                      color: AppColor.cDivider.withValues(alpha: 0.5),
                    );
                  },
                ),
              ],
            ),
    );
  }
}

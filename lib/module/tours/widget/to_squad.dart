import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TOSquad extends StatelessWidget {
  TOSquad({super.key});

  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => tourCtrl.tTeamsList.isEmpty
          ? const SizedBox.shrink()
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: context.wp(4), bottom: context.hp(1), top: context.hp(1.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Team Squad", style: tDmSans(context, fontWeight: FontWeight.w600)),
                      // Spacer(),
                      // SizedBox(width: context.wp(1),),
                      // Icon(Icons.arrow_forward_ios,color: AppColor.subText,size: context.sp(13),),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.hp(10),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: tourCtrl.tTeamsList.length,
                    padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final data = tourCtrl.tTeamsList[index];

                      return GestureDetector(
                        onTap: () {
                          Navigation.pushNamed(Routes.teamSquad, arg: data);
                        },
                        child: Container(
                          height: context.hp(10),
                          width: context.wp(22),
                          decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showFlag(context: context, url: data.image ?? '', w: context.wp(2), h: context.wp(2)),
                              SizedBox(height: context.hp(0.5)),
                              Text(
                                data.nameShort ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: tDmSans(context, fontSize: context.sp(16), fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: context.wp(2.5));
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

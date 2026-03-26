import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TOKeyState extends StatelessWidget {
  TOKeyState({super.key});

  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => tourCtrl.tKeyStatsList.isEmpty
          ? const SizedBox.shrink()
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(4), vertical: context.hp(1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Key Stats", style: tDmSans(context, fontWeight: FontWeight.w600)),
                      // Spacer(),
                      GestureDetector(
                        onTap: () {
                          tourCtrl.tabController?.index = 2;
                        },
                        child: Text("See All", style: stDmSans(context, fontSize: context.sp(13))),
                      ),
                      // SizedBox(width: context.wp(1),),
                      // Icon(Icons.arrow_forward_ios,color: AppColor.subText,size: context.sp(13),),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.hp(11.3),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: tourCtrl.tKeyStatsList.length,
                    padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final data = tourCtrl.tKeyStatsList[index];
                      final ksData = data.leaderboard;
                      final e = (ksData != null && ksData.isNotEmpty) ? ksData.first : null;

                      if (e == null) {
                        return SizedBox.shrink();
                      }

                      return GestureDetector(
                        onTap: () {
                          Navigation.pushNamed(Routes.playerState, arg: data);
                        },
                        child: Container(
                          height: context.hp(11.3),
                          width: context.wp(50),
                          decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsetsGeometry.only(
                                  left: context.wp(1.5),
                                  right: context.wp(2),
                                  top: context.hp(0.5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    showPlayer(
                                      context: context,
                                      url: e.playerImage ?? '',
                                      w: context.wp(3.5),
                                      h: context.wp(3.5),
                                      r: 1,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            data.statName ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            style: stBarlow(context, fontSize: context.sp(15)),
                                          ),
                                          Text(
                                            e.trilling ?? "",
                                            style: tDmSans(context, fontSize: context.sp(20), fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: AppColor.tDivider, height: 0),
                              Padding(
                                padding: EdgeInsetsGeometry.only(left: context.wp(2), right: context.wp(2), top: context.hp(0.5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: context.wp(5)),
                                      child: Text(e.teamShortName ?? "", style: stBarlow(context)),
                                    ),
                                    Flexible(
                                      child: Text("${e.playerName}", overflow: TextOverflow.ellipsis, style: tBarlow(context)),
                                    ),
                                  ],
                                ),
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

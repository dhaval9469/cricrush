import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TOPointTable extends StatelessWidget {
  TOPointTable({super.key});

  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => tourCtrl.tPTList.isEmpty
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
                      Text("Point Table", style: tDmSans(context, fontWeight: FontWeight.w600)),
                      // Spacer(),
                      // SizedBox(width: context.wp(1),),
                      // Icon(Icons.arrow_forward_ios,color: AppColor.subText,size: context.sp(13),),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: AppColor.card),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      final data = tourCtrl.tPTList[index].pointsTableData;
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.wp(2), vertical: context.hp(1)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: context.wp(33),
                                  child: Text("Teams", style: stBarlow(context)),
                                ),
                                ...["M", "W", "L", "NR", "PTS", "NRR"].map(
                                  (title) => SizedBox(
                                    width: context.wp(
                                      title == "PTS"
                                          ? 12
                                          : title == "NRR"
                                          ? 13
                                          : 9.2,
                                    ),
                                    child: Text(title, textAlign: TextAlign.center, style: stBarlow(context)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: AppColor.cDivider, height: 0),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: (data != null && data.length > 3) ? 3 : (data?.length ?? 0),
                            itemBuilder: (context, index) {
                              final pData = data?[index];

                              final stats = [pData?.matches, pData?.won, pData?.lost, pData?.nR, pData?.points, pData?.nRR];

                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: context.wp(2), vertical: context.hp(1)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: context.wp(33),
                                      child: Row(
                                        children: [
                                          showFlag(context: context, url: pData?.teamImage ?? ""),
                                          SizedBox(width: context.wp(2)),
                                          Expanded(
                                            child: Text(
                                              pData?.shortName ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              style: tBarlow(context, fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // --- Stats Columns ---
                                    ...List.generate(stats.length, (i) {
                                      final stat = stats[i];

                                      return SizedBox(
                                        width: context.wp(
                                          i == 4
                                              ? 12
                                              : i == 5
                                              ? 13
                                              : 9.2,
                                        ),
                                        child: Text(
                                          stat?.toString() ?? "",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: tBarlow(context, fontWeight: FontWeight.w600),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(color: AppColor.cDivider, height: 0);
                            },
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: context.hp(1));
                    },
                  ),
                ),
                Divider(color: AppColor.cDivider, height: 0),
                GestureDetector(
                  onTap: () async {
                    tourCtrl.tabController?.index = 4;
                  },
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.card),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.wp(2), vertical: context.hp(1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('View All', style: stDmSans(context, fontSize: context.sp(13))),
                          SizedBox(width: context.wp(1)),
                          Icon(Icons.arrow_forward_ios_sharp, color: AppColor.subText, size: context.sp(13)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointTable extends StatefulWidget {
  const PointTable({super.key});

  @override
  State<PointTable> createState() => _PointTableState();
}

class _PointTableState extends State<PointTable> {
  final mdCtrl = Get.find<MatchDetailsCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => mdCtrl.pointTableLoader.value
            ? Center(child: const DL())
            : mdCtrl.pointsTableList.isEmpty
            ? Center(child: ED(text: "Points table not available"))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: mdCtrl.pointsTableList.length,
                      padding: EdgeInsets.only(bottom: context.hp(3)),
                      itemBuilder: (context, index) {
                        final data = mdCtrl.pointsTableList[index].pointsTableData;
                        String? groupName = mdCtrl.pointsTableList[index].tourName;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            groupName == null || groupName == ""
                                ? SizedBox(height: context.hp(1.5))
                                : Padding(
                                    padding: EdgeInsets.only(
                                      left: context.wp(3),
                                      top: context.hp(1),
                                      bottom: context.hp(0.6),
                                    ),
                                    child: Text(
                                      mdCtrl.pointsTableList[index].tourName ?? "",
                                      style: tDmSans(context, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                            Container(
                              decoration: BoxDecoration(color: AppColor.card),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.wp(2),
                                      vertical: context.hp(1),
                                    ),
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
                                            child: Text(
                                              title,
                                              textAlign: TextAlign.center,
                                              style: stBarlow(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: AppColor.cDivider, height: 0),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: data?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final pData = data?[index];

                                      final stats = [
                                        pData?.matches,
                                        pData?.won,
                                        pData?.lost,
                                        pData?.nR,
                                        pData?.points,
                                        pData?.nRR,
                                      ];

                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: context.wp(2),
                                          vertical: context.hp(1),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: context.wp(33),
                                              child: Row(
                                                children: [
                                                  showFlag(
                                                    context: context,
                                                    url: pData?.teamImage ?? "",
                                                  ),
                                                  SizedBox(width: context.wp(2)),
                                                  Expanded(
                                                    child: Text(
                                                      pData?.shortName ?? "",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: tBarlow(
                                                        context,
                                                        fontWeight: FontWeight.w600,
                                                      ),
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
                                                  style: tBarlow(
                                                    context,
                                                    fontWeight: FontWeight.w600,
                                                  ),
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
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: context.sp(1));
                      },
                    ),
                    SizedBox(height: context.hp(5)),
                  ],
                ),
              ),
      ),
    );
  }
}

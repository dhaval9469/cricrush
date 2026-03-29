import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPointTable extends StatelessWidget {
  TPointTable({super.key});

  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => tourCtrl.tDL.value
            ? Center(child: const DL())
            : tourCtrl.tPTList.isEmpty
            ? Center(child: const ED(text: "Points table not available"))
            : ListView.separated(
                shrinkWrap: true,
                itemCount: tourCtrl.tPTList.length,
                padding: EdgeInsets.only(top: context.hp(1), bottom: context.hp(3)),
                itemBuilder: (context, index) {
                  final data = tourCtrl.tPTList[index].pointsTableData;
                  String? groupName = tourCtrl.tPTList[index].tourName;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      groupName == null || groupName == ""
                          ? SizedBox.shrink()
                          : Padding(
                              padding: EdgeInsets.only(left: context.wp(3), top: context.hp(1), bottom: context.hp(0.6)),
                              child: Text(
                                tourCtrl.tPTList[index].tourName ?? "",
                                style: tDmSans(context, fontWeight: FontWeight.w600),
                              ),
                            ),
                      Container(
                        decoration: BoxDecoration(color: AppColor.card),
                        child: Column(
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
                            Divider(color: AppColor.cDivider, height: context.hp(1)),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data?.length ?? 0,
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
                                return Divider(color: AppColor.cDivider, height: context.hp(1));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: context.hp(1));
                },
              ),
      ),
    );
  }
}

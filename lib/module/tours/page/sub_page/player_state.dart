import 'package:cricrush/module/tours/model/tours_details_model.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerState extends StatelessWidget {
  PlayerState({super.key});

  @override
  Widget build(BuildContext context) {
    final KeyStats keyStats = Get.arguments;
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: CustomAppBar(
        backgroundColor: AppColor.card,
        isBackAppbar: true,
        title: Text(
          "${keyStats.statName}",
          style: tDmSans(context, fontWeight: FontWeight.w600, fontSize: context.sp(17)),
        ),
      ),
      body: keyStats.leaderboard == null || (keyStats.leaderboard?.isEmpty ?? true)
          ? const ED(text: "Matches Not Found")
          : ListView.separated(
              shrinkWrap: true,
              itemCount: keyStats.leaderboard?.length ?? 0,
              padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(1.2)),
              itemBuilder: (context, index) {
                final data = keyStats.leaderboard?[index];
                return Container(
                  decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: context.wp(1.5), right: context.wp(2), top: context.hp(0.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            showPlayer(
                              context: context,
                              url: data?.playerImage ?? '',
                              w: context.wp(3.5),
                              h: context.wp(3.5),
                              r: 1,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${data?.playerName}", overflow: TextOverflow.ellipsis, style: tBarlow(context)),

                                  Text(
                                    data?.trilling ?? "",
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
                        padding: EdgeInsetsGeometry.only(
                          left: context.wp(2),
                          right: context.wp(2),
                          top: context.hp(0.5),
                          bottom: context.hp(0.7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ksItem(context, header: 'HS', text: '${data?.highestScore}'),
                            ksItem(context, header: 'SR', text: '${data?.battingStrikeRate}'),
                            ksItem(context, header: '4s', text: '${data?.fours}'),
                            ksItem(context, header: '6s', text: '${data?.sixes}'),
                            ksItem(context, header: '50s', text: '${data?.fifties}'),
                            ksItem(context, header: '100s', text: '${data?.hundred}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: context.hp(1.2));
              },
            ),
    );
  }

  Column ksItem(BuildContext context, {String? header, String? text}) {
    return Column(
      children: [
        Text("$header", style: stBarlow(context, fontSize: context.sp(13))),
        SizedBox(height: context.hp(0.5)),
        Text("$text", overflow: TextOverflow.ellipsis, style: stDmSans(context)),
      ],
    );
  }
}

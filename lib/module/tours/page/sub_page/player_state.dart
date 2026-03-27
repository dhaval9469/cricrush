import 'package:cricrush/module/tours/model/tours_details_model.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/tours_widget.dart';

class PlayerState extends StatelessWidget {
  const PlayerState({super.key});

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
                  decoration: BoxDecoration(
                    color: AppColor.card,
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                              url: data?.playerImage ?? '',
                              w: context.wp(3.5),
                              h: context.wp(3.5),
                              r: 1,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${data?.playerName} - ${data?.teamShortName}",
                                    overflow: TextOverflow.ellipsis,
                                    style: tBarlow(context),
                                  ),

                                  Text(
                                    data?.trilling ?? "",
                                    style: tDmSans(
                                      context,
                                      fontSize: context.sp(20),
                                      fontWeight: FontWeight.bold,
                                    ),
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
                        child: keyStats.statName?.toLowerCase() == "most runs"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ksItem(
                                    context,
                                    header: 'HS',
                                    text: '${data?.highestScore.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'SR',
                                    text: '${data?.battingStrikeRate.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'MP',
                                    text: '${data?.matchesPlayed.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'IP',
                                    text: '${data?.inningsPlayed.orDash}',
                                  ),
                                  ksItem(context, header: '50s', text: '${data?.fifties.orDash}'),
                                  ksItem(context, header: '100s', text: '${data?.hundred.orDash}'),
                                ],
                              )
                            : keyStats.statName?.toLowerCase() == "most wickets"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ksItem(context, header: 'O', text: '${data?.overs.orDash}'),
                                  ksItem(context, header: 'M', text: '${data?.mostMaidens.orDash}'),
                                  ksItem(context, header: 'R', text: '${data?.runsGiven.orDash}'),
                                  ksItem(context, header: 'EC', text: '${data?.economy.orDash}'),
                                  ksItem(
                                    context,
                                    header: 'MP',
                                    text: '${data?.matchesPlayed.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'IP',
                                    text: '${data?.inningsPlayed.orDash}',
                                  ),
                                ],
                              )
                            : keyStats.statName?.toLowerCase() == "most 6s" ||
                                  keyStats.statName?.toLowerCase() == "most 4s"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ksItem(
                                    context,
                                    header: 'HS',
                                    text: '${data?.highestScore.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'SR',
                                    text: '${data?.battingStrikeRate.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'MP',
                                    text: '${data?.matchesPlayed.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'IP',
                                    text: '${data?.inningsPlayed.orDash}',
                                  ),
                                  ksItem(context, header: '50s', text: '${data?.fifties.orDash}'),
                                  ksItem(context, header: '100s', text: '${data?.hundred.orDash}'),
                                ],
                              )
                            : keyStats.statName?.toLowerCase() == "highest score"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ksItem(
                                    context,
                                    header: 'SR',
                                    text: '${data?.battingStrikeRate.orDash}',
                                  ),
                                  ksItem(context, header: '4s', text: '${data?.fours.orDash}'),
                                  ksItem(context, header: '6s', text: '${data?.sixes.orDash}'),
                                  ksItem(
                                    context,
                                    header: 'MP',
                                    text: '${data?.matchesPlayed.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'IP',
                                    text: '${data?.inningsPlayed.orDash}',
                                  ),
                                ],
                              )
                            : keyStats.statName?.toLowerCase() == "best strike rate"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ksItem(
                                    context,
                                    header: 'HS',
                                    text: '${data?.highestScore.orDash}',
                                  ),
                                  ksItem(context, header: '4s', text: '${data?.fours.orDash}'),
                                  ksItem(context, header: '6s', text: '${data?.sixes.orDash}'),
                                  ksItem(context, header: '50s', text: '${data?.fifties.orDash}'),
                                  ksItem(
                                    context,
                                    header: 'MP',
                                    text: '${data?.matchesPlayed.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'IP',
                                    text: '${data?.inningsPlayed.orDash}',
                                  ),
                                ],
                              )
                            : keyStats.statName?.toLowerCase() == "most fifties"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ksItem(
                                    context,
                                    header: 'HS',
                                    text: '${data?.highestScore.orDash}',
                                  ),
                                  ksItem(context, header: 'RS', text: '${data?.runsScored.orDash}'),
                                  ksItem(context, header: 'AV', text: '${data?.average.orDash}'),
                                  ksItem(
                                    context,
                                    header: 'MP',
                                    text: '${data?.matchesPlayed.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'IP',
                                    text: '${data?.inningsPlayed.orDash}',
                                  ),
                                ],
                              )
                            : keyStats.statName?.toLowerCase() == "best figures"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ksItem(context, header: 'O', text: '${data?.overs.orDash}'),
                                  ksItem(context, header: 'M', text: '${data?.mostMaidens.orDash}'),
                                  ksItem(context, header: 'R', text: '${data?.runsGiven.orDash}'),
                                  ksItem(context, header: 'W', text: '${data?.wickets.orDash}'),
                                  ksItem(context, header: 'EC', text: '${data?.economy.orDash}'),
                                ],
                              )
                            :
                        keyStats.statName?.toLowerCase() == "best bowling strike rate"
                            ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ksItem(context, header: 'O', text: '${data?.overs.orDash}'),
                            ksItem(context, header: 'M', text: '${data?.mostMaidens.orDash}'),
                            ksItem(context, header: 'R', text: '${data?.runsGiven.orDash}'),
                            ksItem(context, header: 'W', text: '${data?.wickets.orDash}'),
                            ksItem(context, header: 'EC', text: '${data?.economy.orDash}'),
                          ],
                        )
                            :
                        keyStats.statName?.toLowerCase() == "most expensive bowler"
                            ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ksItem(context, header: 'O', text: '${data?.overs.orDash}'),
                            ksItem(context, header: 'M', text: '${data?.mostMaidens.orDash}'),
                            ksItem(context, header: 'W', text: '${data?.wickets.orDash}'),
                            ksItem(context, header: 'EC', text: '${data?.economy.orDash}'),
                            ksItem(context, header: 'BS', text: '${data?.bowlingStrikeRate.orDash}'),
                          ],
                        )
                            :
                        Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ksItem(
                                    context,
                                    header: 'HS',
                                    text: '${data?.highestScore.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'SR',
                                    text: '${data?.battingStrikeRate.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'MP',
                                    text: '${data?.matchesPlayed.orDash}',
                                  ),
                                  ksItem(
                                    context,
                                    header: 'IP',
                                    text: '${data?.inningsPlayed.orDash}',
                                  ),
                                  ksItem(context, header: '50s', text: '${data?.fifties.orDash}'),
                                  ksItem(context, header: '100s', text: '${data?.hundred.orDash}'),
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

  String orDash(dynamic value) {
    if (value == null) return "-";

    final str = value.toString();
    return str.isEmpty ? "-" : str;
  }
}

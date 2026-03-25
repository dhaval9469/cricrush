import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/model/lmw_model.dart';
import 'package:cricrush/module/match_details/service/lmw_ser.dart';
import 'package:cricrush/module/match_details/widget/md_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LmdFinish extends StatelessWidget {
  final WSLSDetailsModel? data;

  LmdFinish({super.key, this.data});

  final mdCtrl = Get.find<MatchDetailsCtrl>();
  final lmwService = Get.find<LMWService>();

  @override
  Widget build(BuildContext context) {
    List<WSLMTeam> firstInnings = [];
    List<WSLMTeam> secondInnings = [];

    data?.team?.forEach((element) {
      if (element.battingteam == data?.team1Name) {
        firstInnings.add(element);
      } else {
        secondInnings.add(element);
      }
    });

    if (firstInnings.isEmpty) {
      return SizedBox(height: context.hp(8));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.hp(1.5)),
          firstInnings.isEmpty
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.card,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColor.tDivider, width: 2.5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: context.hp(1.5), horizontal: context.wp(3)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: context.wp(60),
                                child: Row(
                                  children: [
                                    showFlag(
                                      context: context,
                                      url: "${data?.team1Image}",
                                      h: context.wp(1.9),
                                      w: context.wp(1.9),
                                    ),
                                    SizedBox(width: context.wp(2.5)),
                                    Flexible(
                                      child: Text(
                                        "${data?.team1Name}",
                                        overflow: TextOverflow.ellipsis,
                                        style: tDmSans(
                                          context,
                                          fontSize: context.sp(16),
                                          fontWeight: data?.win == data?.team1Name ? FontWeight.bold : FontWeight.w600,
                                          color: data?.win == data?.team1Name ? AppColor.text : AppColor.subText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              firstInnings.isEmpty
                                  ? Text("Yet to Bet", style: stDmSans(context))
                                  : Row(
                                      children: [
                                        Text(
                                          "${firstInnings.last.total}/${firstInnings.last.wickets}",
                                          style: tBarlow(
                                            context,
                                            fontSize: context.sp(18),
                                            fontWeight: data?.win == data?.team1Name ? FontWeight.bold : FontWeight.w600,
                                            color: data?.win == data?.team1Name ? AppColor.winText : AppColor.subText,
                                          ),
                                        ),

                                        Text(
                                          "  (",
                                          style: stBarlow(
                                            context,
                                            fontSize: context.sp(16),
                                            color: data?.win == data?.team1Name ? AppColor.winText : AppColor.subText,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                                          child: Text(
                                            "${firstInnings.last.overs}",
                                            style: stBarlow(
                                              context,
                                              fontSize: context.sp(15),
                                              color: data?.win == data?.team1Name ? AppColor.winText : AppColor.subText,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          ")",
                                          style: stBarlow(
                                            context,
                                            fontSize: context.sp(16),
                                            color: data?.win == data?.team1Name ? AppColor.winText : AppColor.subText,
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                          SizedBox(height: context.hp(1)),
                          Row(
                            children: [
                              SizedBox(
                                width: context.wp(60),
                                child: Row(
                                  children: [
                                    showFlag(
                                      context: context,
                                      url: "${data?.team2Image}",
                                      h: context.wp(1.7),
                                      w: context.wp(1.7),
                                    ),
                                    SizedBox(width: context.wp(2.5)),
                                    Flexible(
                                      child: Text(
                                        "${data?.team2Name}",
                                        overflow: TextOverflow.ellipsis,
                                        style: tDmSans(
                                          context,
                                          fontSize: context.sp(16),
                                          fontWeight: data?.win == data?.team2Name ? FontWeight.bold : FontWeight.w600,
                                          color: data?.win == data?.team2Name ? AppColor.text : AppColor.subText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              secondInnings.isEmpty
                                  ? Text("Yet to Bet", style: stDmSans(context))
                                  : Row(
                                      children: [
                                        Text(
                                          "${secondInnings.last.total}/${secondInnings.last.wickets}",
                                          style: tBarlow(
                                            context,
                                            fontSize: context.sp(18),
                                            fontWeight: data?.win == data?.team2Name ? FontWeight.bold : FontWeight.w600,
                                            color: data?.win == data?.team2Name ? AppColor.winText : AppColor.subText,
                                          ),
                                        ),

                                        Text(
                                          "  (",
                                          style: stBarlow(
                                            context,
                                            fontSize: context.sp(16),
                                            color: data?.win == data?.team2Name ? AppColor.winText : AppColor.subText,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                                          child: Text(
                                            "${secondInnings.last.overs}",
                                            style: stBarlow(
                                              context,
                                              fontSize: context.sp(15),
                                              color: data?.win == data?.team2Name ? AppColor.winText : AppColor.subText,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          ")",
                                          style: stBarlow(
                                            context,
                                            fontSize: context.sp(16),
                                            color: data?.win == data?.team2Name ? AppColor.winText : AppColor.subText,
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                          Divider(color: AppColor.cDivider, height: context.hp(3)),
                          Text("${data?.equation}", style: stDmSans(context)),
                        ],
                      ),
                    ),
                  ),
                ),

          data?.awards?.isEmpty ?? true
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(left: context.wp(3), right: context.wp(3), top: context.hp(1.2)),
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.only(left: context.wp(3), top: context.hp(1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          showPlayer(
                            context: context,
                            h: context.wp(3),
                            w: context.wp(3),
                            url: data?.awards?.last.playerImage ?? "",
                            r: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: context.wp(7), bottom: context.hp(1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Player Of The Match", style: stBarlow(context, fontSize: context.sp(13))),
                                Padding(
                                  padding: EdgeInsets.only(top: context.hp(0.2), bottom: context.hp(0.3)),
                                  child: Container(height: context.sp(1), width: context.wp(30), color: AppColor.cDivider),
                                ),
                                Text(
                                  capitalizeEachWord("${data?.awards?.last.playerName?.capitalize}"),
                                  style: tBarlow(context, fontSize: context.sp(16)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

          data?.team?.isEmpty ?? true
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(1.2)),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data?.team?.length ?? 0,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final playerData = data?.team?[index];
                      return ExpansionTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: AppColor.tDivider),
                        ),
                        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: AppColor.card,
                        collapsedBackgroundColor: AppColor.card,
                        minTileHeight: context.hp(5),
                        iconColor: AppColor.text,
                        collapsedIconColor: AppColor.text,
                        expansionAnimationStyle: const AnimationStyle(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                        ),
                        initiallyExpanded: false,
                        tilePadding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${playerData?.battingteam}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: tDmSans(context),
                              ),
                            ),
                            Text("${playerData?.total}/${playerData?.wickets}", style: tDmSans(context)),
                            Text(" (", style: stDmSans(context, fontSize: context.sp(13))),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                              child: Text("${playerData?.overs}", style: stDmSans(context, fontSize: context.sp(13))),
                            ),
                            Text(")", style: stDmSans(context, fontSize: context.sp(13))),
                          ],
                        ),
                        children: [
                          Container(color: AppColor.card, child: bpHeader(context)),
                          Container(
                            color: AppColor.background,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: context.hp(0.5)),
                              itemCount: playerData?.bestPerformers?.batsmen?.length ?? 0,
                              itemBuilder: (context, batsmenIndex) {
                                final batsmanData = playerData?.bestPerformers?.batsmen?[batsmenIndex];
                                return bpBatsman(context, batsmanData);
                              },
                            ),
                          ),
                          Container(color: AppColor.card, child: bpBHeader(context)),
                          Container(
                            color: AppColor.background,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: context.hp(0.5)),
                              itemCount: playerData?.bestPerformers?.bowlers?.length ?? 0,
                              itemBuilder: (context, batsmenIndex) {
                                final batsmanData = playerData?.bestPerformers?.bowlers?[batsmenIndex];
                                return bpBowler(context, batsmanData);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: context.hp(1.2));
                    },
                  ),
                ),

          data?.notes?[0].desc?.isEmpty ?? true
              ? const SizedBox.shrink()
              : ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data?.notes?.length ?? 0,
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  itemBuilder: (context, index) {
                    final noteData = data?.notes?[index];
                    return Container(
                      decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.wp(2.5), vertical: context.hp(1)),
                            child: Row(
                              children: [
                                showFlag(
                                  context: context,
                                  url: noteData?.teamImage ?? "",
                                  h: context.wp(1.3),
                                  w: context.wp(1.3),
                                ),
                                SizedBox(width: context.wp(2.5)),
                                Text("${noteData?.team} Match Flow", style: tBarlow(context)),
                              ],
                            ),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: noteData?.desc?.length ?? 0,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final summary = noteData?.desc?[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: context.hp(0.7), horizontal: context.wp(2.5)),
                                child: Text(summary ?? '', style: stBarlow(context, fontSize: context.sp(13))),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(height: 0, color: AppColor.tDivider);
                            },
                          ),
                          SizedBox(height: context.hp(0.5)),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: context.hp(1.3));
                  },
                ),

          data?.matches?.isEmpty ?? true
              ? SizedBox()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: context.wp(4), bottom: context.hp(0.5), top: context.hp(1.3)),
                      child: Text(
                        "Next Matches",
                        style: stDmSans(context, color: AppColor.text, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                      itemCount: data?.matches?.length ?? 0,
                      itemBuilder: (context, index) {
                        final matchData = data?.matches?[index];
                        return nextUpCoMatch(context, matchData);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: context.hp(1.3));
                      },
                    ),
                  ],
                ),

          data?.matchesFinal?.isEmpty ?? true
              ? SizedBox()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: context.wp(4), bottom: context.hp(0.5), top: context.hp(1.3)),
                      child: Text(
                        "Completed Matches",
                        style: stDmSans(context, color: AppColor.text, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                      itemCount: data?.matchesFinal?.length ?? 0,
                      itemBuilder: (context, index) {
                        final matchData = data?.matchesFinal?[index];
                        return finishMatch(context, matchData);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: context.hp(1.3));
                      },
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

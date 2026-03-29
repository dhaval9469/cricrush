import 'package:cricrush/ad_module/native/native_banner.dart';
import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/analytics_service.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Commentary extends StatefulWidget {
  const Commentary({super.key});

  @override
  State<Commentary> createState() => _CommentaryState();
}

class _CommentaryState extends State<Commentary> {
  final mdCtrl = Get.find<MatchDetailsCtrl>();


  @override
  void initState() {
    AnalyticsService().logScreen('CommentaryScreen');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => mdCtrl.commentaryLoading.value
            ? Center(child: const DL())
            : mdCtrl.commentaryData.value?.commentary?.isEmpty ?? true
            ? Center(child: ED(text: "Commentary not available"))
            : Obx(
                () => SmartRefresher(
                  controller: mdCtrl.refreshCommCtrl,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: () async {
                    await mdCtrl.getCommentary(mdCtrl.matchId.value, silentRefresh: true);
                    mdCtrl.refreshCommCtrl.resetNoData();
                    mdCtrl.refreshCommCtrl.refreshCompleted();
                  },
                  onLoading: () async {
                    await mdCtrl.getCommentaryByInning(mdCtrl.matchId.value);
                  },

                  // header: CommonRefreshHeader(context),
                  // footer: CommonRefreshFooter(context),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: context.sp(7)),
                          itemCount: mdCtrl.commentaryData.value?.commentary?.length ?? 0,
                          itemBuilder: (context, index) {
                            final data = mdCtrl.commentaryData.value?.commentary?[index];
                            List<String> endOver = data?.thisOverNew?.split(',') ?? [""];
                            if (endOver.last.isEmpty) {
                              endOver.removeLast();
                            }

                            return Column(
                              children: [
                                if (data?.totaRuns?.isNotEmpty ?? false)
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        color: AppColor.card,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: context.wp(3),
                                            vertical: context.hp(1),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: context.wp(15),
                                                    alignment: Alignment.topLeft,
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        right: BorderSide(
                                                          color: AppColor.cDivider,
                                                          width: 1,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "OVER",
                                                          style: stDmSans(
                                                            context,
                                                            fontSize: context.sp(12),
                                                          ),
                                                        ),
                                                        SizedBox(height: context.hp(0.2)),
                                                        Text(
                                                          "${data?.totalOver}",
                                                          style: tDmSans(
                                                            context,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: context.wp(3)),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "${data?.totaRuns ?? "0"} ${data?.totaRuns == "1" ? "Run" : "Runs"} ",
                                                            style: tDmSans(
                                                              context,
                                                              fontSize: context.sp(14),
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                          data?.wickets == "0"
                                                              ? const SizedBox.shrink()
                                                              : Text(
                                                                  "${data?.wickets ?? "0"} ${data?.wickets == "1" ? "Wicket" : "Wickets"} ",
                                                                  style: tDmSans(
                                                                    context,
                                                                    fontSize: context.sp(14),
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                      SizedBox(height: context.hp(0.2)),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: (data?.thisOverNew ?? "")
                                                              .split(",")
                                                              .map(
                                                                (e) => TextSpan(
                                                                  text: "$e   ",
                                                                  // spacing like you used
                                                                  style: stDmSans(
                                                                    context,
                                                                    fontSize: context.sp(13),
                                                                    color: e.trim() == "W"
                                                                        ? AppColor.wicket
                                                                        : e.trim() == "4"
                                                                        ? AppColor.four
                                                                        : e.trim() == "6"
                                                                        ? AppColor.six
                                                                        : AppColor.subText,
                                                                  ),
                                                                ),
                                                              )
                                                              .toList(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "${getbtsn(data?.battingTeam ?? "")}  ${data?.score}",
                                                        style: tDmSans(
                                                          context,
                                                          fontSize: context.sp(14),
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(height: context.hp(0.2)),

                                                      Text(
                                                        "CRR: ${calculateCRR("${data?.score}", "${data?.over}").toStringAsFixed(2)}",
                                                        style: stDmSans(
                                                          context,
                                                          fontSize: context.sp(12),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Divider(color: AppColor.cDivider, thickness: 0.7),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "${data?.batsmen?.first.batsmenName}",
                                                            style: stDmSans(
                                                              context,
                                                              fontSize: context.sp(12),
                                                            ),
                                                          ),
                                                          SizedBox(width: context.wp(2)),
                                                          Text(
                                                            "${data?.batsmen?.first.runs}",
                                                            style: stDmSans(
                                                              context,
                                                              fontSize: context.sp(12),
                                                            ),
                                                          ),
                                                          SizedBox(width: context.wp(1.5)),
                                                          Text(
                                                            "(${data?.batsmen?.first.balls})",
                                                            style: stDmSans(
                                                              context,
                                                              fontSize: context.sp(12),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "${data?.batsmen?.last.nonStrikerName}",
                                                            style: stDmSans(
                                                              context,
                                                              fontSize: context.sp(12),
                                                            ),
                                                          ),
                                                          SizedBox(width: context.wp(2)),
                                                          Text(
                                                            "${data?.batsmen?.last.runs}",
                                                            style: stDmSans(
                                                              context,
                                                              fontSize: context.sp(12),
                                                            ),
                                                          ),
                                                          SizedBox(width: context.wp(1.5)),
                                                          Text(
                                                            "(${data?.batsmen?.last.balls})",
                                                            style: stDmSans(
                                                              context,
                                                              fontSize: context.sp(12),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${data?.bowlers?.last.bowlersName}",
                                                        style: stDmSans(
                                                          context,
                                                          fontSize: context.sp(12),
                                                        ),
                                                      ),
                                                      SizedBox(width: context.wp(2)),
                                                      Text(
                                                        "${data?.bowlers?.last.runs}/${data?.bowlers?.last.wickets}",
                                                        style: stDmSans(
                                                          context,
                                                          fontSize: context.sp(12),
                                                        ),
                                                      ),
                                                      SizedBox(width: context.wp(1.5)),
                                                      Text(
                                                        "(${data?.bowlers?.last.overs})",
                                                        style: stDmSans(
                                                          context,
                                                          fontSize: context.sp(12),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: context.hp(1.5)),
                                    ],
                                  )
                                else
                                  const SizedBox.shrink(),

                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: context.wp(15),
                                        child: Text("${data?.over}", style: stDmSans(context)),
                                      ),
                                      Expanded(
                                        child: Text(
                                          ((data?.defaultCommentary?.split(':').length ?? 0) > 1
                                              ? data!.defaultCommentary!
                                                    .split(':')
                                                    .sublist(1)
                                                    .join(':')
                                                    .trim()
                                              : data?.defaultCommentary ?? ""),
                                          style: stBarlow(context, fontSize: context.sp(13)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: context.hp(0.5)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: context.wp(15),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            height: context.wp(7),
                                            width: context.wp(7),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: data?.runs == "4"
                                                  ? AppColor.four
                                                  : data?.runs == "6"
                                                  ? AppColor.six
                                                  : data?.runs == "W"
                                                  ? AppColor.wicket
                                                  : AppColor.card,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              "${data?.runs}",
                                              style: stDmSans(
                                                context,
                                                color:
                                                    data?.runs == "4" ||
                                                        data?.runs == "6" ||
                                                        data?.runs == "W"
                                                    ? AppColor.text
                                                    : AppColor.subText,
                                                fontWeight:
                                                    data?.runs == "4" ||
                                                        data?.runs == "6" ||
                                                        data?.runs == "W"
                                                    ? FontWeight.w900
                                                    : FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${data?.commentary}',
                                          style: stBarlow(context, fontSize: context.sp(13)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                index == 0
                                    ? NativeBannerB(
                                        isTransparent: true,
                                        padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                                      )
                                    : SizedBox(),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: context.hp(index == 0 ? 0 : 2));
                          },
                        ),
                        SizedBox(height: context.hp(5)),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  String getbtsn(String name) {
    if (name == mdCtrl.teamAName.value) return mdCtrl.teamASName.value;
    if (name == mdCtrl.teamBName.value) return mdCtrl.teamBSName.value;
    return name;
  }

  double calculateCRR(String totalRunsStr, String oversStr) {
    int totalRuns = int.tryParse(totalRunsStr.split('/')[0]) ?? 0;

    List<String> parts = oversStr.split('.');
    int overs = int.tryParse(parts[0]) ?? 0;
    int balls = parts.length > 1 ? int.tryParse(parts[1]) ?? 0 : 0;

    double oversDecimal = overs + (balls / 6);

    if (oversDecimal == 0) return 0;

    return totalRuns / oversDecimal;
  }
}

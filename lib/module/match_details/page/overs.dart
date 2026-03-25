import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Overs extends StatefulWidget {
  const Overs({super.key});

  @override
  State<Overs> createState() => _OversState();
}

class _OversState extends State<Overs> {
  final mdCtrl = Get.find<MatchDetailsCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => mdCtrl.overLoading.value
            ? Center(child: const DL())
            : mdCtrl.overData.value?.ing?.isEmpty ?? true
            ? Center(child: ED(text: "Not available"))
            : SmartRefresher(
                controller: mdCtrl.refreshOverCtrl,
                enablePullDown: true,
                onRefresh: () async {
                  await mdCtrl.getOver(mdCtrl.matchId.value, silentRefresh: true);
                  mdCtrl.refreshOverCtrl.refreshCompleted();
                },
                // header: CommonRefreshHeader(context),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: context.sp(7)),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: mdCtrl.overData.value?.ing?.length,
                        itemBuilder: (context, index) {
                          final oboData = mdCtrl.overData.value?.ing?[index];
                          final teams = mdCtrl.overData.value?.team ?? [];
                          final reversedTeams = teams.reversed.toList();
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                                child: Container(
                                  decoration: BoxDecoration(color: AppColor.card),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: context.hp(0.7),
                                      horizontal: context.wp(3),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(oboData?.battingteam ?? "", style: tDmSans(context)),
                                        Spacer(),
                                        Text(
                                          "${reversedTeams[index].total}/${reversedTeams[index].wickets}",
                                          style: tDmSans(context, fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(width: context.sp(7)),
                                        Text("(", style: stDmSans(context)),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: context.sp(1.5),
                                          ),
                                          child: Text(
                                            "${reversedTeams[index].overs}",
                                            style: stDmSans(context),
                                          ),
                                        ),
                                        Text(")", style: stDmSans(context)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                reverse: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                                itemCount: oboData?.overbyover?.length ?? 0,
                                itemBuilder: (context, oboIndex) {
                                  final data = oboData?.overbyover?[oboIndex];
                                  String? input = data?.thisOverNew;
                                  List<String> endOver = input?.split(',') ?? [""];
                                  if (endOver.last.isEmpty) {
                                    endOver.removeLast();
                                  }
                                  return Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data?.euation ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: stBarlow(context),
                                          ),
                                          SizedBox(height: context.sp(2)),
                                          Row(
                                            children: [
                                              Text(
                                                'Over ${data?.over.toString()}:   ',
                                                style: stBarlow(context),
                                              ),

                                              SizedBox(
                                                height: context.hp(2.3),
                                                width: context.wp(60),
                                                child: ListView.separated(
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: endOver.length,
                                                  itemBuilder: (context, index) {
                                                    final data = endOver[index];
                                                    return Text(
                                                      data.toUpperCase(),
                                                      textAlign: TextAlign.center,
                                                      style: stDmSans(
                                                        context,
                                                        fontSize:
                                                            data.toLowerCase().contains("wd") ||
                                                                data.toLowerCase().contains("nb") ||
                                                                data.toLowerCase().contains("lb")
                                                            ? context.sp(13)
                                                            : context.sp(15),
                                                        color: data == "4"
                                                            ? AppColor.four
                                                            : data == "6"
                                                            ? AppColor.six
                                                            : data.toLowerCase() == "w"
                                                            ? AppColor.wicket
                                                            : AppColor.subText,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (BuildContext context, int index) {
                                                        return SizedBox(width: context.wp(3));
                                                      },
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${data?.runs} runs',
                                                style: tBarlow(
                                                  context,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(color: AppColor.cDivider, height: context.sp(15));
                                },
                              ),
                            ],
                          );
                        },
                      ),

                      SizedBox(height: context.hp(5)),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

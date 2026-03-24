import 'package:cricrush/module/home/model/all_match_model.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/time_manager.dart';
import 'package:flutter/material.dart';

Widget mcHeader({required BuildContext context, required String tourName}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: EdgeInsetsGeometry.only(
          right: context.wp(3),
          left: context.wp(3),
          top: context.hp(0.4),
          bottom: context.hp(0.9),
        ),
        child: Row(
          children: [
            Flexible(
              child: Text(tourName, overflow: TextOverflow.ellipsis, style: tBarlow(context)),
            ),
            // SizedBox(width: context.wp(3)),
            // Icon(Icons.arrow_forward_ios, color: AppColor.text, size: context.sp(14)),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsetsGeometry.only(right: context.wp(3), left: context.wp(3)),
        child: Divider(color: AppColor.cDivider, height: 0),
      ),
    ],
  );
}

Widget sLive({required BuildContext context, MTLiveMatch? data}) {
  List<Innings> firstInnings = [];
  List<Innings> secondInnings = [];
  data?.innings?.forEach((element) {
    if (element.nameShort == data.teamlist?[0].nameShort) {
      firstInnings.add(element);
    } else {
      secondInnings.add(element);
    }
  });
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SizedBox(
            width: context.wp(68),
            child: Row(
              children: [
                showFlag(context: context, url: data?.teamlist?[0].teamImage ?? ""),
                SizedBox(width: context.wp(2.5)),
                Flexible(
                  child: Text(
                    "${data?.teamlist?[0].nameFull}",
                    overflow: TextOverflow.ellipsis,
                    style: tDmSans(
                      context,
                      color: firstInnings.isEmpty ? AppColor.subText : AppColor.text,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: context.wp(10)),
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
                        fontSize: context.sp(17),
                        fontWeight: firstInnings.last.batting == true ? FontWeight.w600 : FontWeight.w500,
                        color: firstInnings.last.batting == true ? AppColor.liveText : AppColor.subText,
                      ),
                    ),

                    Text(
                      "  (",
                      style: stBarlow(
                        context,
                        fontSize: context.sp(16),
                        color: firstInnings.last.batting == true ? AppColor.liveText : AppColor.subText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                      child: Text(
                        "${firstInnings.last.overs}",
                        style: stBarlow(
                          context,
                          fontSize: context.sp(15),
                          color: firstInnings.last.batting == true ? AppColor.liveText : AppColor.subText,
                        ),
                      ),
                    ),
                    Text(
                      ")",
                      style: stBarlow(
                        context,
                        fontSize: context.sp(16),
                        color: firstInnings.last.batting == true ? AppColor.liveText : AppColor.subText,
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
            width: context.wp(68),
            child: Row(
              children: [
                showFlag(context: context, url: data?.teamlist?[1].teamImage ?? ""),
                SizedBox(width: context.wp(2.5)),
                Flexible(
                  child: Text(
                    "${data?.teamlist?[1].nameFull}",
                    overflow: TextOverflow.ellipsis,
                    style: tDmSans(context,
                        color: secondInnings.isEmpty ? AppColor.subText : AppColor.text,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(width: context.wp(10)),
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
                        fontSize: context.sp(17),
                        fontWeight: secondInnings.last.batting == true ? FontWeight.w600 : FontWeight.w500,
                        color: secondInnings.last.batting == true ? AppColor.liveText : AppColor.subText,
                      ),
                    ),

                    Text(
                      "  (",
                      style: stBarlow(
                        context,
                        fontSize: context.sp(16),
                        color: secondInnings.last.batting == true ? AppColor.liveText : AppColor.subText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                      child: Text(
                        "${secondInnings.last.overs}",
                        style: stBarlow(
                          context,
                          fontSize: context.sp(15),
                          color: secondInnings.last.batting == true ? AppColor.liveText : AppColor.subText,
                        ),
                      ),
                    ),
                    Text(
                      ")",
                      style: stBarlow(
                        context,
                        fontSize: context.sp(16),
                        color: secondInnings.last.batting == true ? AppColor.liveText : AppColor.subText,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    ],
  );
}

Widget sUpComing({required BuildContext context, MTUpComingMatch? data}) {
  return Row(
    children: [
      SizedBox(
        width: context.wp(70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                showFlag(context: context, url: data?.teamaImage ?? ""),
                SizedBox(width: context.wp(2.5)),
                Flexible(
                  child: Text(
                    "${data?.teama}",
                    overflow: TextOverflow.ellipsis,
                    style: tDmSans(context, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.hp(1)),
            Row(
              children: [
                showFlag(context: context, url: data?.teambImage ?? ""),
                SizedBox(width: context.wp(2.5)),
                Flexible(
                  child: Text(
                    "${data?.teamb}",
                    overflow: TextOverflow.ellipsis,
                    style: tDmSans(context, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: context.hp(5),
        width: context.sp(1),
        decoration: BoxDecoration(color: AppColor.cDivider.withValues(alpha: 0.7), borderRadius: BorderRadius.circular(8)),
      ),
      Expanded(
        child: TimeManager.upMDT('${data?.matchdateIst} ${data?.matchtimeIst}').contains("h")
            ? Text(
                TimeManager.upMDT('${data?.matchdateIst} ${data?.matchtimeIst}'),
                textAlign: TextAlign.center,
                style: stDmSans(context, fontSize: context.sp(15)),
              )
            : Text(
                TimeManager.upMDT('${data?.matchdateIst} ${data?.matchtimeIst}'),
                textAlign: TextAlign.center,
                style: stDmSans(context, fontSize: context.sp(13)),
              ),
      ),
    ],
  );
}

Widget sFinish({required BuildContext context, MTResultsMatch? data}) {
  List<Innings> firstInnings = [];
  List<Innings> secondInnings = [];
  data?.innings?.forEach((element) {
    if (element.nameShort == data.teamlist?[0].nameShort) {
      firstInnings.add(element);
    } else {
      secondInnings.add(element);
    }
  });

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SizedBox(
            width: context.wp(65),
            child: Row(
              children: [
                showFlag(context: context, url: data?.teamlist?[0].teamImage ?? ""),
                SizedBox(width: context.wp(2.5)),
                Flexible(
                  child: Text(
                    "${data?.teamlist?[0].nameFull}",
                    overflow: TextOverflow.ellipsis,

                    style: tDmSans(
                      context,
                      fontWeight: FontWeight.w600,
                      color: data?.matchdetail?.win == data?.teamlist?[0].nameShort ? AppColor.text : AppColor.subText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          firstInnings.isEmpty
              ? Text("Yet to Bet", style: stDmSans(context, fontSize: context.sp(13)))
              : Row(
                  children: [
                    Text(
                      "${firstInnings.last.total}/${firstInnings.last.wickets}",
                      style: tBarlow(
                        context,
                        fontSize: context.sp(15),
                        fontWeight: data?.matchdetail?.win == data?.teamlist?[0].nameShort ? FontWeight.w600 : FontWeight.w500,
                        color: data?.matchdetail?.win == data?.teamlist?[0].nameShort ? AppColor.winText : AppColor.subText,
                      ),
                    ),

                    Text(
                      "  (",
                      style: stBarlow(
                        context,
                        color: data?.matchdetail?.win == data?.teamlist?[0].nameShort ? AppColor.winText : AppColor.subText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                      child: Text(
                        "${firstInnings.last.overs}",
                        style: stBarlow(
                          context,
                          fontSize: context.sp(13),
                          color: data?.matchdetail?.win == data?.teamlist?[0].nameShort ? AppColor.winText : AppColor.subText,
                        ),
                      ),
                    ),
                    Text(
                      ")",
                      style: stBarlow(
                        context,
                        color: data?.matchdetail?.win == data?.teamlist?[0].nameShort ? AppColor.winText : AppColor.subText,
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
            width: context.wp(65),
            child: Row(
              children: [
                showFlag(context: context, url: data?.teamlist?[1].teamImage ?? ""),
                SizedBox(width: context.wp(2.5)),
                Flexible(
                  child: Text(
                    "${data?.teamlist?[1].nameFull}",
                    overflow: TextOverflow.ellipsis,
                    style: tDmSans(
                      context,
                      fontWeight: FontWeight.w600,
                      color: data?.matchdetail?.win == data?.teamlist?[1].nameShort ? AppColor.text : AppColor.subText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          secondInnings.isEmpty
              ? Text("Yet to Bet", style: stDmSans(context, fontSize: context.sp(13)))
              : Row(
                  children: [
                    Text(
                      "${secondInnings.last.total}/${secondInnings.last.wickets}",
                      style: tBarlow(
                        context,
                        fontSize: context.sp(15),
                        fontWeight: data?.matchdetail?.win == data?.teamlist?[1].nameShort ? FontWeight.w600 : FontWeight.w500,
                        color: data?.matchdetail?.win == data?.teamlist?[1].nameShort ? AppColor.winText : AppColor.subText,
                      ),
                    ),

                    Text(
                      "  (",
                      style: stBarlow(
                        context,
                        color: data?.matchdetail?.win == data?.teamlist?[1].nameShort ? AppColor.winText : AppColor.subText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                      child: Text(
                        "${secondInnings.last.overs}",
                        style: stBarlow(
                          context,
                          fontSize: context.sp(13),
                          color: data?.matchdetail?.win == data?.teamlist?[1].nameShort ? AppColor.winText : AppColor.subText,
                        ),
                      ),
                    ),
                    Text(
                      ")",
                      style: stBarlow(
                        context,
                        color: data?.matchdetail?.win == data?.teamlist?[1].nameShort ? AppColor.winText : AppColor.subText,
                      ),
                    ),
                  ],
                ),
        ],
      ),
      SizedBox(height: context.hp(1)),
      Text(
        "${data?.matchdetail?.equation}",
        overflow: TextOverflow.ellipsis,
        style: stBarlow(context, fontSize: context.sp(12)),
      ),
    ],
  );
}

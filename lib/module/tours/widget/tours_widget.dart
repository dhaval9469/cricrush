import 'package:cricrush/module/tours/model/tours_details_model.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/time_manager.dart';
import 'package:flutter/material.dart';

Widget tLive({required BuildContext context, TourLiveM? data}) {
  List<TourMLInnings> firstInnings = [];
  List<TourMLInnings> secondInnings = [];
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
            width: context.wp(60),
            child: Row(
              children: [
                showFlag(context: context, url: data?.teamlist?[0].teamImage ?? ""),
                SizedBox(width: context.wp(2.5)),
                Flexible(
                  child: Text(
                    "${data?.teamlist?[0].nameFull}",
                    overflow: TextOverflow.ellipsis,
                    style: tDmSans(context, fontWeight: FontWeight.w600),
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
                        fontWeight: firstInnings.last.batting == true ? FontWeight.w600 : FontWeight.w500,
                        color: firstInnings.last.batting == true ? AppColor.text : AppColor.subText,
                      ),
                    ),

                    Text("  (", style: stBarlow(context)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                      child: Text("${firstInnings.last.overs}", style: stBarlow(context, fontSize: context.sp(13))),
                    ),
                    Text(")", style: stBarlow(context)),
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
                showFlag(context: context, url: data?.teamlist?[1].teamImage ?? ""),
                SizedBox(width: context.wp(2.5)),
                Flexible(
                  child: Text(
                    "${data?.teamlist?[1].nameFull}",
                    overflow: TextOverflow.ellipsis,
                    style: tDmSans(context, fontWeight: FontWeight.w600),
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
                        fontWeight: secondInnings.last.batting == true ? FontWeight.w600 : FontWeight.w500,
                        color: secondInnings.last.batting == true ? AppColor.text : AppColor.subText,
                      ),
                    ),

                    Text("  (", style: stBarlow(context)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                      child: Text("${secondInnings.last.overs}", style: stBarlow(context, fontSize: context.sp(13))),
                    ),
                    Text(")", style: stBarlow(context)),
                  ],
                ),
        ],
      ),
    ],
  );
}

Widget tUpComing({required BuildContext context, TourUpcomingM? data}) {
  return Container(
    decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(12)),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: context.wp(3), right: context.wp(3), bottom: context.hp(0.8), top: context.hp(0.7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${data?.matchnumber} - ${data?.city}", style: stBarlow(context)),
              Text(
                "UPCOMING",
                style: stBarlow(context, fontSize: context.sp(13), color: AppColor.upcoming, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Divider(color: AppColor.cDivider, height: 0),
        Padding(
          padding: EdgeInsets.only(left: context.wp(3), bottom: context.hp(1.2), top: context.hp(1.2)),
          child: Row(
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
                decoration: BoxDecoration(
                  color: AppColor.cDivider.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
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
          ),
        ),
      ],
    ),
  );
}

Widget tFinish({required BuildContext context, TourResultsM? data}) {
  List<TourMLInnings> firstInnings = [];
  List<TourMLInnings> secondInnings = [];
  data?.innings?.forEach((element) {
    if (element.nameShort == data.teamlist?[0].nameShort) {
      firstInnings.add(element);
    } else {
      secondInnings.add(element);
    }
  });

  return Container(
    decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(12)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: context.wp(3), right: context.wp(3), bottom: context.hp(0.8), top: context.hp(0.7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${data?.matchdetail?.match?.number}", style: stBarlow(context)),
              Text(
                "COMPLETED",
                style: stBarlow(context, fontSize: context.sp(13), color: AppColor.finished, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Divider(color: AppColor.cDivider, height: 0),
        Padding(
          padding: EdgeInsets.only(left: context.wp(3), top: context.hp(1.2)),
          child: Row(
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
        ),
        Padding(
          padding: EdgeInsets.only(left: context.wp(3), bottom: context.hp(1), top: context.hp(1)),
          child: Row(
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
        ),
        Padding(
          padding: EdgeInsets.only(left: context.wp(3), right: context.wp(3), bottom: context.hp(1)),
          child: Text(
            "${data?.matchdetail?.equation}",
            overflow: TextOverflow.ellipsis,
            style: stDmSans(context, fontSize: context.sp(13)),
          ),
        ),
      ],
    ),
  );
}

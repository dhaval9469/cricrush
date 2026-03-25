import 'package:cricrush/module/match_details/model/scoreboard_model.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:flutter/material.dart';

Widget commonTab(BuildContext context, {required String title}) {
  return Tab(
    height: context.hp(4),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
      child: Text(title),
    ),
  );
}

Widget matchVI(BuildContext context, {String? header, String? text}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: context.wp(25),
        child: Text(header ?? '', style: stDmSans(context, fontSize: context.sp(13))),
      ),
      Expanded(
        child: Text(
          text ?? '',
          overflow: TextOverflow.fade,
          style: tBarlow(context, fontSize: context.sp(14)),
        ),
      ),
    ],
  );
}

Widget sbBatsmanHeader(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: context.sp(8), bottom: context.sp(8), left: context.sp(7)),
    child: Row(
      children: [
        SizedBox(
          width: context.wp(42),
          child: Padding(
            padding: EdgeInsets.only(left: context.sp(5)),
            child: Text("Batters", style: scHeaderStyle(context)),
          ),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text("R", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text("B", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text("4", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text("6", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(13),
          child: Text("SR", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
      ],
    ),
  );
}

Widget sbBatsmanInfo(BuildContext context, InningBatsman? batterData) {
  return Padding(
    padding: EdgeInsets.only(left: context.sp(7)),
    child: Row(
      children: [
        SizedBox(
          width: context.wp(42),
          child: Row(
            children: [
              showPlayer(
                context: context,
                url: batterData?.playerImage ?? "",
                h: context.wp(1.5),
                w: context.wp(1.5),
              ),
              SizedBox(width: context.wp(2)),
              Flexible(
                child: Text(
                  batterData?.batsmanName ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: batterData?.howout == "Batting" ? stBarlow(context) : lbStyle(context),
                ),
              ),
              SizedBox(width: context.sp(5)),
              // if (batterData?.howout == "Batting") Image.asset(AppAssets.batter, scale: 30),
            ],
          ),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text(batterData?.runs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text(
            batterData?.balls ?? "",
            textAlign: TextAlign.center,
            style: lbStyle(context),
          ),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text(
            batterData?.fours ?? "",
            textAlign: TextAlign.center,
            style: lbStyle(context),
          ),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text(
            batterData?.sixes ?? "",
            textAlign: TextAlign.center,
            style: lbStyle(context),
          ),
        ),
        SizedBox(
          width: context.wp(14),
          child: Text(
            batterData!.strikerate.toString().isEmpty
                ? ""
                : double.parse(batterData.strikerate.toString()).toStringAsFixed(2),
            overflow: TextOverflow.clip,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: lbStyle(context),
          ),
        ),
      ],
    ),
  );
}

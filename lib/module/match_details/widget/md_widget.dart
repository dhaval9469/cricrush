import 'package:cricrush/module/match_details/model/lmw_model.dart';
import 'package:cricrush/module/match_details/model/scoreboard_model.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/time_manager.dart';
import 'package:flutter/material.dart';

String getOrdinal(int number) {
  if (number % 100 >= 11 && number % 100 <= 13) {
    return '${number}th';
  }

  switch (number % 10) {
    case 1:
      return '${number}st';
    case 2:
      return '${number}nd';
    case 3:
      return '${number}rd';
    default:
      return '${number}th';
  }
}

String capitalizeEachWord(String text) {
  return text
      .split(' ')
      .map((word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      })
      .join(' ');
}

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

Widget matchUC(BuildContext context, {String? header, String? text}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: context.wp(25),
        child: Text(header ?? '', style: stDmSans(context)),
      ),
      Expanded(
        child: Text(text ?? '', overflow: TextOverflow.fade, style: stBarlow(context)),
      ),
    ],
  );
}

Widget sbBatsmanHeader(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: context.hp(1), bottom: context.hp(1), left: context.sp(7)),
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
              showPlayer(context: context, url: batterData?.playerImage ?? "", h: context.wp(1.5), w: context.wp(1.5)),
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
          child: Text(batterData?.balls ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text(batterData?.fours ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text(batterData?.sixes ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(14),
          child: Text(
            batterData!.strikerate.toString().isEmpty ? "" : double.parse(batterData.strikerate.toString()).toStringAsFixed(2),
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

Widget sbBowlerHeader(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: context.hp(1), bottom: context.hp(1), left: context.sp(7)),
    child: Row(
      children: [
        SizedBox(
          width: context.wp(42),
          child: Padding(
            padding: EdgeInsets.only(left: context.sp(5)),
            child: Text("Bowlers", style: scHeaderStyle(context)),
          ),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text("O", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text("R", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text("W", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text("M", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(13),
          child: Text("ER", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
      ],
    ),
  );
}

Widget sbBowlerInfo(BuildContext context, InningBowlers? bowlerData) {
  return Padding(
    padding: EdgeInsets.only(left: context.sp(7)),
    child: Row(
      children: [
        SizedBox(
          width: context.wp(42),
          child: Row(
            children: [
              showPlayer(context: context, url: bowlerData?.playerImage ?? "", h: context.wp(1.5), w: context.wp(1.5)),
              SizedBox(width: context.wp(2)),
              Flexible(
                child: Text(
                  bowlerData?.bowlersName ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: bowlerData?.isbowlingnow == true ? stBarlow(context) : lbStyle(context),
                ),
              ),
              SizedBox(width: context.sp(5)),
              // bowlerData?.isbowlingnow == true
              //     ? Image.asset(AppAssets.bowler, scale: 40)
              //     : const SizedBox.shrink(),
            ],
          ),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text(bowlerData?.overs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text(bowlerData?.runs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text(bowlerData?.wickets ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text(bowlerData?.maidens ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(14),
          child: Text(
            bowlerData?.economyrate.toString().isEmpty ?? true
                ? ""
                : double.parse(bowlerData?.economyrate ?? "").toStringAsFixed(2),
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

Widget sbFWHeader(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: context.sp(8), bottom: context.sp(8), left: context.sp(7)),
    child: Row(
      children: [
        SizedBox(
          width: context.wp(55),
          child: Padding(
            padding: EdgeInsets.only(left: context.sp(5)),
            child: Text("Fall Of Wicket", style: scHeaderStyle(context)),
          ),
        ),
        SizedBox(
          width: context.wp(20),
          child: Text("Over", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(20),
          child: Text("Score", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
      ],
    ),
  );
}

Widget sbFWInfo(BuildContext context, InningFallofWickets? fwData) {
  return Padding(
    padding: EdgeInsets.only(left: context.sp(7)),
    child: Row(
      children: [
        SizedBox(
          width: context.wp(55),
          child: Row(
            children: [
              showPlayer(context: context, url: fwData?.playerImage ?? "", h: context.wp(1.5), w: context.wp(1.5)),
              SizedBox(width: context.wp(2)),
              Flexible(
                child: Text(fwData?.batsmanName ?? "", overflow: TextOverflow.ellipsis, style: lbStyle(context)),
              ),
            ],
          ),
        ),
        SizedBox(
          width: context.wp(20),
          child: Text(fwData?.overs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(20),
          child: Text("${fwData?.wicketNo}/${fwData?.score}", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
      ],
    ),
  );
}

Widget bpHeader(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: context.hp(0.7), horizontal: context.wp(2)),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: context.sp(5)),
          child: Text("Best Performers Batsman", style: scHeaderStyle(context)),
        ),
        Spacer(),
        SizedBox(
          width: context.wp(10),
          child: Text("R", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(10),
          child: Text("B", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
      ],
    ),
  );
}

Widget bpBatsman(BuildContext context, WSLMBPBatsmen? batterData) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: context.hp(0.5), horizontal: context.wp(2)),
    child: Row(
      children: [
        showPlayer(context: context, url: batterData?.playerImage ?? "", h: context.wp(1.5), w: context.wp(1.5)),
        SizedBox(width: context.wp(2)),
        Expanded(
          child: Text(batterData?.playerName ?? "", overflow: TextOverflow.ellipsis, style: lbStyle(context)),
        ),
        SizedBox(width: context.sp(3)),
        SizedBox(
          width: context.wp(10),
          child: Text(batterData?.runs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(10),
          child: Text(batterData?.balls ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
      ],
    ),
  );
}

Widget bpBHeader(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: context.hp(0.7), horizontal: context.wp(2)),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: context.sp(5)),
          child: Text("Best Performers Bowler", style: scHeaderStyle(context)),
        ),
        Spacer(),
        SizedBox(
          width: context.wp(10),
          child: Text("R", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(8),
          child: Text("W", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(10),
          child: Text("O", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
      ],
    ),
  );
}

Widget bpBowler(BuildContext context, WSLMBPBowlers? bowlerData) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: context.hp(0.5), horizontal: context.wp(2)),
    child: Row(
      children: [
        showPlayer(context: context, url: bowlerData?.playerImage ?? "", h: context.wp(1.5), w: context.wp(1.5)),
        SizedBox(width: context.wp(2)),
        Expanded(
          child: Text(bowlerData?.playerName ?? "", overflow: TextOverflow.ellipsis, style: lbStyle(context)),
        ),
        SizedBox(width: context.sp(3)),
        SizedBox(
          width: context.wp(10),
          child: Text(bowlerData?.runs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(8),
          child: Text(bowlerData?.wickets ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(10),
          child: Text(bowlerData?.overs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
      ],
    ),
  );
}

Widget nextUpCoMatch(BuildContext context, WSLMUPCMatch? data) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColor.card),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: context.hp(0.7)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(2.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${data?.matchnumber}", style: stDmSans(context, fontSize: context.sp(12))),
                Text(
                  TimeManager.nextUpMT('${data?.matchdateIst} ${data?.matchtimeIst}'),
                  style: stBarlow(context, fontSize: context.sp(12)),
                ),
              ],
            ),
          ),
          Divider(color: AppColor.tDivider, height: context.hp(1.5)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(2.5),vertical: context.hp(0.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    showFlag(context: context, url: data?.teamaImage ?? "", w: context.wp(1.5), h: context.wp(1.5)),
                    SizedBox(width: context.wp(2.5)),
                    Text("${data?.teamaShort}", style: tDmSans(context)),
                  ],
                ),
                Row(
                  children: [
                    Text("${data?.teambShort}", style: tDmSans(context)),
                    SizedBox(width: context.wp(2.5)),
                    showFlag(context: context, url: data?.teambImage ?? "", w: context.wp(1.5), h: context.wp(1.5)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget finishMatch(BuildContext context, WSLMMatchesFinal? data) {
  List<WSFMInning> teamA = [];
  List<WSFMInning> teamB = [];
  List<WSFMInning> firstInnings = [];
  List<WSFMInning> secondInnings = [];

  data?.innings?.forEach((element) {
    if (element.nameShort == data.teamlist?[0].nameShort) {
      teamA.add(element);
    } else {
      teamB.add(element);
    }
  });
  firstInnings = teamA.reversed.toList(growable: true);
  secondInnings = teamB.reversed.toList(growable: true);

  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColor.card),

    child: Padding(
      padding: EdgeInsets.symmetric(vertical: context.hp(0.7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.hp(0.4)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(2.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        showFlag(
                          context: context,
                          url: data?.teamlist?[0].teamImage ?? "",
                          w: context.wp(1.3),
                          h: context.wp(1.3),
                        ),
                        SizedBox(width: context.wp(2.5)),
                        Text(
                          "${data?.teamlist?[0].nameShort}",
                          style: tDmSans(
                            context,
                            fontSize: context.sp(14),
                            color: data?.matchdetail?.win == data?.teamlist?[0].nameShort ? AppColor.text : AppColor.subText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.hp(0.3)),
                    firstInnings.isEmpty
                        ? Text("Yet to Bet", style: stDmSans(context, fontSize: context.sp(13)))
                        : Row(
                            children: [
                              Text(
                                "${firstInnings.last.total}/${firstInnings.last.wickets}",
                                style: tBarlow(
                                  context,
                                  fontSize: context.sp(15),
                                  fontWeight: data?.matchdetail?.win == data?.teamlist?[0].nameShort
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: data?.matchdetail?.win == data?.teamlist?[0].nameShort
                                      ? AppColor.text
                                      : AppColor.subText,
                                ),
                              ),

                              Text(
                                "  (",
                                style: stBarlow(
                                  context,
                                  color: data?.matchdetail?.win == data?.teamlist?[0].nameShort
                                      ? AppColor.text
                                      : AppColor.subText,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                                child: Text(
                                  "${firstInnings.last.overs}",
                                  style: stBarlow(
                                    context,
                                    fontSize: context.sp(13),
                                    color: data?.matchdetail?.win == data?.teamlist?[0].nameShort
                                        ? AppColor.text
                                        : AppColor.subText,
                                  ),
                                ),
                              ),
                              Text(
                                ")",
                                style: stBarlow(
                                  context,
                                  color: data?.matchdetail?.win == data?.teamlist?[0].nameShort
                                      ? AppColor.text
                                      : AppColor.subText,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${data?.teamlist?[1].nameShort}",
                          style: tDmSans(
                            context,
                            fontSize: context.sp(14),
                            color: data?.matchdetail?.win == data?.teamlist?[1].nameShort ? AppColor.text : AppColor.subText,
                          ),
                        ),
                        SizedBox(width: context.wp(2.5)),
                        showFlag(
                          context: context,
                          url: data?.teamlist?[1].teamImage ?? "",
                          w: context.wp(1.3),
                          h: context.wp(1.3),
                        ),
                      ],
                    ),
                    SizedBox(height: context.hp(0.3)),
                    secondInnings.isEmpty
                        ? Text("Yet to Bet", style: stDmSans(context, fontSize: context.sp(13)))
                        : Row(
                            children: [
                              Text(
                                "${secondInnings.last.total}/${secondInnings.last.wickets}",
                                style: tBarlow(
                                  context,
                                  fontSize: context.sp(15),
                                  fontWeight: data?.matchdetail?.win == data?.teamlist?[1].nameShort
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: data?.matchdetail?.win == data?.teamlist?[1].nameShort
                                      ? AppColor.text
                                      : AppColor.subText,
                                ),
                              ),

                              Text(
                                "  (",
                                style: stBarlow(
                                  context,
                                  color: data?.matchdetail?.win == data?.teamlist?[1].nameShort
                                      ? AppColor.text
                                      : AppColor.subText,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                                child: Text(
                                  "${secondInnings.last.overs}",
                                  style: stBarlow(
                                    context,
                                    fontSize: context.sp(13),
                                    color: data?.matchdetail?.win == data?.teamlist?[1].nameShort
                                        ? AppColor.text
                                        : AppColor.subText,
                                  ),
                                ),
                              ),
                              Text(
                                ")",
                                style: stBarlow(
                                  context,
                                  color: data?.matchdetail?.win == data?.teamlist?[1].nameShort
                                      ? AppColor.text
                                      : AppColor.subText,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: AppColor.tDivider, height: context.hp(1.5)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(2.5)),
            child: Text("${data?.matchdetail?.equation}", style: stDmSans(context, fontSize: context.sp(12))),
          ),
        ],
      ),
    ),
  );
}

Widget liveBatsmanInfo(BuildContext context, WSLMBatsmen? batterData) {
  return Padding(
    padding: EdgeInsets.only(left: context.sp(7)),
    child: Row(
      children: [
        SizedBox(
          width: context.wp(42),
          child: Row(
            children: [
              showPlayer(context: context, url: batterData?.playerImage ?? "", h: context.wp(1.5), w: context.wp(1.5)),
              SizedBox(width: context.wp(2)),
              Flexible(
                child: Text(
                  batterData?.batsman ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: batterData?.isonstrike == true ? stBarlow(context, color: AppColor.text) : lbStyle(context),
                ),
              ),
              SizedBox(width: context.sp(5)),
            ],
          ),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text(batterData?.runs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text(batterData?.balls ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text(batterData?.fours ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text(batterData?.sixes ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(14),
          child: Text(
            batterData!.strikerate.toString().isEmpty ? "" : double.parse(batterData.strikerate.toString()).toStringAsFixed(2),
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

Widget liveBowlerInfo(BuildContext context, WSLMBowlers? data) {
  return Padding(
    padding: EdgeInsets.only(left: context.sp(7)),
    child: Row(
      children: [
        SizedBox(
          width: context.wp(42),
          child: Row(
            children: [
              showPlayer(context: context, url: data?.playerImage ?? "", h: context.wp(1.5), w: context.wp(1.5)),
              SizedBox(width: context.wp(2)),
              Flexible(
                child: Text(data?.bowler ?? "", overflow: TextOverflow.ellipsis, style: lbStyle(context)),
              ),
              SizedBox(width: context.sp(5)),
              // bowlerData?.isbowlingnow == true
              //     ? Image.asset(AppAssets.bowler, scale: 40)
              //     : const SizedBox.shrink(),
            ],
          ),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text(data?.overs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(11),
          child: Text(data?.runs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text(data?.wickets ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(9),
          child: Text(data?.maidens ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(14),
          child: Text(
            data?.economyrate.toString().isEmpty ?? true ? "" : double.parse(data?.economyrate ?? "").toStringAsFixed(2),
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

Widget livePPHeader(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: context.hp(1), bottom: context.hp(1), left: context.sp(7)),
    child: Row(
      children: [
        SizedBox(
          width: context.wp(45),
          child: Padding(
            padding: EdgeInsets.only(left: context.sp(5)),
            child: Text("PowerPlay", style: scHeaderStyle(context)),
          ),
        ),
        SizedBox(
          width: context.wp(15),
          child: Text("Overs", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(15),
          child: Text("Runs", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
        SizedBox(
          width: context.wp(15),
          child: Text("Wickets", textAlign: TextAlign.center, style: scHeaderStyle(context)),
        ),
      ],
    ),
  );
}

Widget livePPInfo(BuildContext context, WSLMPowerPlayDetails? data) {
  return Padding(
    padding: EdgeInsets.only(top: context.sp(8), left: context.sp(5)),
    child: Row(
      children: [
        SizedBox(
          width: context.wp(45),
          child: Padding(
            padding: EdgeInsets.only(left: context.sp(5)),
            child: Text(data?.name ?? "", overflow: TextOverflow.ellipsis, style: lbStyle(context)),
          ),
        ),
        SizedBox(
          width: context.wp(15),
          child: Text(data?.overs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(15),
          child: Text(data?.runs ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
        SizedBox(
          width: context.wp(15),
          child: Text(data?.wickets ?? "", textAlign: TextAlign.center, style: lbStyle(context)),
        ),
      ],
    ),
  );
}

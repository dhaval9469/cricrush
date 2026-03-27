import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/model/lmw_model.dart';
import 'package:cricrush/module/match_details/service/lmw_ser.dart';
import 'package:cricrush/module/match_details/widget/md_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class LmdLive extends StatefulWidget {
  final WSLSDetailsModel? data;

  const LmdLive({super.key, this.data});

  @override
  State<LmdLive> createState() => _LmdLiveState();
}

class _LmdLiveState extends State<LmdLive> {
  final mdCtrl = Get.find<MatchDetailsCtrl>();

  final lmwService = Get.find<LMWService>();

  String showBall = "";
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    configureTts();
    super.initState();
  }

  Future<void> configureTts() async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.setVoice({"name": "en-in-x-end-network", "locale": "en-IN"});
  }

  @override
  Widget build(BuildContext context) {
    List<WSLMTeam> firstInnings = [];
    List<WSLMTeam> secondInnings = [];

    widget.data?.team?.forEach((element) {
      if (element.battingteam == mdCtrl.teamAName.value) {
        firstInnings.add(element);
      } else {
        secondInnings.add(element);
      }
    });

    final battingTeam = widget.data?.team?.firstWhere((team) => team.batting == true);

    if (firstInnings.isEmpty) {
      WSLMTeam team = WSLMTeam(overs: "0.0", total: "0", wickets: "0", runrate: "0.0");
      firstInnings.add(team);
    }

    if (secondInnings.isEmpty) {
      WSLMTeam team = WSLMTeam(overs: "0.0", total: "0", wickets: "0", runrate: "0.0");
      secondInnings.add(team);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      mdCtrl.matchStatus.value = widget.data?.status?.toLowerCase() ?? "";
      processBall(widget.data);
    });

    final isSecondBatting = secondInnings.isNotEmpty && secondInnings.last.batting == true;

    final crrText = "CR: ${battingTeam?.runrate ?? '-'}";
    final rrText = (widget.data?.requiredRunrate != null && widget.data?.requiredRunrate != "null")
        ? "RR: ${widget.data?.requiredRunrate}"
        : "";

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          firstInnings.isEmpty
              ? SizedBox()
              : Container(
                  decoration: BoxDecoration(color: AppColor.card),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: context.hp(1.5), horizontal: context.wp(3)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    showFlag(context: context, url: mdCtrl.teamAFlag.value, w: context.wp(2), h: context.wp(2)),
                                    SizedBox(height: context.hp(0.5)),
                                    Text(
                                      mdCtrl.teamASName.value,
                                      overflow: TextOverflow.visible,
                                      maxLines: 1,
                                      style: tBarlow(
                                        context,
                                        fontWeight: firstInnings.last.batting == true ? FontWeight.w600 : FontWeight.w500,
                                        color: firstInnings.last.batting == true ? AppColor.text : AppColor.subText,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: context.wp(3)),
                                firstInnings.isEmpty
                                    ? Text("Yet to Bet", style: stDmSans(context))
                                    : Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${firstInnings.last.total}/${firstInnings.last.wickets}",
                                            overflow: TextOverflow.ellipsis,
                                            style: tBarlow(
                                              context,
                                              fontSize: context.sp(18),
                                              fontWeight: firstInnings.last.batting == true ? FontWeight.w600 : FontWeight.w500,
                                              color: firstInnings.last.batting == true ? AppColor.text : AppColor.subText,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text("(", style: stBarlow(context, fontSize: context.sp(15))),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                                                child: Text(
                                                  "${firstInnings.last.overs}",
                                                  style: stBarlow(context, fontSize: context.sp(15)),
                                                ),
                                              ),
                                              Text(")", style: stBarlow(context, fontSize: context.sp(15))),
                                            ],
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                                child: SizedBox(height: context.hp(6), child: showBallDetails(context, showBall)),
                              ),
                            ),
                            Row(
                              children: [
                                secondInnings.isEmpty
                                    ? Text("Yet to Bet", style: stDmSans(context))
                                    : Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${secondInnings.last.total}/${secondInnings.last.wickets}",
                                            overflow: TextOverflow.ellipsis,
                                            style: tBarlow(
                                              context,
                                              fontSize: context.sp(18),
                                              fontWeight: secondInnings.last.batting == true ? FontWeight.w600 : FontWeight.w500,
                                              color: secondInnings.last.batting == true ? AppColor.text : AppColor.subText,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text("(", style: stBarlow(context, fontSize: context.sp(15))),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                                                child: Text(
                                                  "${secondInnings.last.overs}",
                                                  style: stBarlow(context, fontSize: context.sp(15)),
                                                ),
                                              ),
                                              Text(")", style: stBarlow(context, fontSize: context.sp(15))),
                                            ],
                                          ),
                                        ],
                                      ),
                                SizedBox(width: context.wp(3)),
                                Column(
                                  children: [
                                    showFlag(context: context, url: mdCtrl.teamBFlag.value, w: context.wp(2), h: context.wp(2)),
                                    SizedBox(height: context.hp(0.5)),
                                    Text(
                                      mdCtrl.teamBSName.value,
                                      overflow: TextOverflow.ellipsis,
                                      style: tBarlow(
                                        context,
                                        fontWeight: secondInnings.last.batting == true ? FontWeight.w600 : FontWeight.w500,
                                        color: secondInnings.last.batting == true ? AppColor.text : AppColor.subText,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: context.hp(1)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(isSecondBatting ? rrText : crrText, style: stBarlow(context, fontSize: context.sp(13))),
                            widget.data?.status?.toLowerCase() == "match ended"
                                ? Text("${widget.data?.equation}", style: stBarlow(context, fontSize: context.sp(13)))
                                : widget.data?.status?.toLowerCase() != "play in progress"
                                ? Text(
                                    "${widget.data?.status}",
                                    style: stBarlow(
                                      context,
                                      fontSize: context.sp(17),
                                      color: AppColor.status,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : SizedBox.shrink(),
                            Text(isSecondBatting ? crrText : rrText, style: stBarlow(context, fontSize: context.sp(13))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

          Padding(
            padding: EdgeInsets.only(top: context.hp(1.5)),
            child: SizedBox(
              height: context.hp(3),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: widget.data?.overDetails?.length ?? 0,
                padding: EdgeInsets.symmetric(horizontal: context.sp(15)),
                itemBuilder: (context, ovDetailsIndex) {
                  final overDetails = widget.data?.overDetails?[ovDetailsIndex];
                  String? input = overDetails?.thisOver;
                  List<String> endOver = input?.split(',') ?? [""];

                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          getOrdinal(overDetails?.overNumber ?? 0),
                          style: stBarlow(context, fontSize: context.sp(15), fontWeight: FontWeight.w600),
                        ),

                        SizedBox(width: context.wp(2.5)),

                        Row(
                          children: List.generate(endOver.length, (index) {
                            final ballData = endOver[index];

                            return Padding(
                              padding: EdgeInsets.only(right: index == endOver.length - 1 ? 0 : context.wp(1.8)),
                              child: Container(
                                height: context.hp(3),
                                width: context.wp(8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: ballData.toLowerCase() == "w"
                                      ? AppColor.wicket
                                      : ballData == "6"
                                      ? AppColor.six
                                      : ballData == "4"
                                      ? AppColor.four
                                      : AppColor.subCard,
                                ),
                                child: Text(
                                  ballData.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: tDmSans(
                                    context,
                                    color: AppColor.text,
                                    fontSize:
                                        ballData.toLowerCase().contains("wd") ||
                                            ballData.toLowerCase().contains("nb") ||
                                            ballData.toLowerCase().contains("lb")
                                        ? context.sp(10)
                                        : context.sp(18),
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),

                        SizedBox(width: context.wp(2)),

                        Text(
                          "= ${overDetails?.totalRuns ?? 0}",
                          style: tDmSans(context, fontSize: context.sp(18), fontWeight: FontWeight.w600, color: AppColor.text),
                        ),

                        if (ovDetailsIndex != (widget.data?.overDetails?.length ?? 0) - 1) ...[
                          SizedBox(width: context.wp(0.7)),
                          VerticalDivider(
                            endIndent: context.sp(1),
                            indent: context.sp(1),
                            color: AppColor.cDivider,
                            thickness: 1,
                          ),
                          SizedBox(width: context.wp(0.7)),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          widget.data?.matchdetail?[0].batsmen?.isEmpty ?? true
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(top: context.hp(1.5)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: AppColor.card),
                        child: sbBatsmanHeader(context),
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                        itemCount: widget.data?.matchdetail?[0].batsmen?.length ?? 0,
                        itemBuilder: (context, batIndex) {
                          final batsmanData = widget.data?.matchdetail?[0].batsmen?[batIndex];
                          return liveBatsmanInfo(context, batsmanData);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(color: AppColor.tDivider, height: context.hp(2));
                        },
                      ),
                    ],
                  ),
                ),

          widget.data?.matchdetail?[0].bowlers?.isEmpty ?? true
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(top: context.hp(1.3)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: AppColor.card),
                        child: sbBowlerHeader(context),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                        itemCount: widget.data?.matchdetail?[0].bowlers?.length ?? 0,
                        itemBuilder: (context, bowIndex) {
                          final bowlerData = widget.data?.matchdetail?[0].bowlers?[bowIndex];
                          return liveBowlerInfo(context, bowlerData);
                        },
                      ),
                    ],
                  ),
                ),

          widget.data?.matchdetail?[0].powerPlayDetails?.isEmpty ?? true
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(top: context.hp(1.3)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: AppColor.card),
                        child: livePPHeader(context),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                        itemCount: widget.data?.matchdetail?[0].powerPlayDetails?.length ?? 0,
                        itemBuilder: (context, index) {
                          final ppd = widget.data?.matchdetail?[0].powerPlayDetails?[index];
                          return livePPInfo(context, ppd);
                        },
                      ),
                    ],
                  ),
                ),

          widget.data?.matchdetail?[0].powerPlayDetails?.isEmpty ?? true
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(top: context.hp(1.3)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: AppColor.card),
                        child: Padding(
                          padding: EdgeInsets.only(top: context.hp(1), bottom: context.hp(1), left: context.sp(7)),
                          child: Row(children: [Text("Last 6 Balls Momentum", style: scHeaderStyle(context))]),
                        ),
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                        itemCount: widget.data?.commentry?.length ?? 0,
                        itemBuilder: (context, comIndex) {
                          final cData = widget.data?.commentry?[comIndex];
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: context.wp(15),
                                      child: Text("${cData?.over}", style: stDmSans(context)),
                                    ),
                                    Expanded(
                                      child: Text(
                                        ((cData?.defaultCommentary?.split(':').length ?? 0) > 1
                                            ? cData!.defaultCommentary!.split(':').sublist(1).join(':').trim()
                                            : cData?.defaultCommentary ?? ""),
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
                                            color: cData?.runs == "4"
                                                ? AppColor.four
                                                : cData?.runs == "6"
                                                ? AppColor.six
                                                : cData?.runs == "W"
                                                ? AppColor.wicket
                                                : AppColor.card,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            "${cData?.runs}",
                                            style: stDmSans(
                                              context,
                                              color: cData?.runs == "4" || cData?.runs == "6" || cData?.runs == "W"
                                                  ? AppColor.text
                                                  : AppColor.subText,
                                              fontWeight: cData?.runs == "4" || cData?.runs == "6" || cData?.runs == "W"
                                                  ? FontWeight.w900
                                                  : FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text('${cData?.commentary}', style: stBarlow(context, fontSize: context.sp(13))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(color: AppColor.tDivider, height: context.hp(2));
                        },
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Future<void> processBall(WSLSDetailsModel? data) async {
    if (data == null) return;

    final ballNo = data.ballNo;

    // 🟢 Ball 6 & OVER already triggered → speak OVER
    if (ballNo == 6 && mdCtrl.over.value != 0) {
      await speakOver(data);
      return;
    }

    // 🟡 Ball 6 first time → speak ball
    if (ballNo == 6 && mdCtrl.over.value == 0) {
      speakBall(data);
      mdCtrl.over.value++;
      return;
    }

    // 🔵 Normal balls (1–5)
    if (ballNo != null && ballNo != 6) {
      speakBall(data);
      mdCtrl.over.value = 0;
    }
  }

  void speakBall(WSLSDetailsModel data) {
    final over = data.matchdetail?[0].thisOver;
    if (over == null || over.isEmpty) return;

    final last = over.last;
    String text;

    switch (last.t) {
      case "w":
        text = last.t ?? "";
        break;
      case "wd":
        text = last.t ?? "";
        break;
      case "nb":
        text = last.t ?? "";
        break;
      case "lb":
        text = "leg bye ${last.b} Run";
        break;
      default:
        text = "${last.b}";
    }

    showBall = text;
    speakText(text, over.length);
  }

  Future<void> speakOver(WSLSDetailsModel data) async {
    await Future.delayed(const Duration(seconds: 5));

    final match = data.matchdetail?[0];
    if (match == null) return;

    showBall = "OVER";

    speakText(
      showBall,
      (match.thisOver?.length ?? 0) + 1,
      over:
          "${match.battingteam}"
          "${match.total}Run "
          "${match.wickets}Wicket "
          "After${data.overNo}Over",
    );

    await Future.delayed(const Duration(seconds: 7));

    // showOverAd(data);
  }

  Future<void> speakText(String text, int index, {String? over}) async {
    if (mdCtrl.speakText.value != index && text.toLowerCase() != "null") {
      if (text == "w") {
        await flutterTts.speak("Out");
      } else if (text == "wd") {
        await flutterTts.speak("wide ball");
      } else if (text == "nb") {
        await flutterTts.speak("No ball");
      } else if (text == "0") {
        await flutterTts.speak("dot ball");
      } else if (text == "1") {
        await flutterTts.speak("one Run");
      } else if (text == "2") {
        await flutterTts.speak("two Run");
      } else if (text == "3") {
        await flutterTts.speak("three Run");
      } else if (text == "4") {
        await flutterTts.speak("four Run");
      } else if (text == "6") {
        await flutterTts.speak("six Run");
      } else if (text == "OVER") {
        await flutterTts.speak(over.toString());
      } else if (text == "Lunch") {
        await flutterTts.speak("Lunch Break");
      } else if (text == "Tea") {
        await flutterTts.speak("Tea Break");
      } else if (text == "Drinks") {
        await flutterTts.speak("Drinks Break");
      } else if (text == "Innings Break") {
        await flutterTts.speak(text);
      } else {
        await flutterTts.speak(text);
      }
    }
    mdCtrl.speakText.value = index;
  }

  Widget showBallDetails(BuildContext context, String? ball) {
    switch (ball) {
      case "0":
        return Center(child: animatedText(context, "0", fontSize: context.sp(40)));
      case "1":
        return Center(child: animatedText(context, "1 Run"));
      case "2":
        return Center(child: animatedText(context, "2 Run"));
      case "3":
        return Center(child: animatedText(context, "3 Run"));
      case "4":
        return Center(child: animatedText(context, "4 Run", color: AppColor.four));
      case "6":
        return Center(child: animatedText(context, "6 Run", color: AppColor.six));
      case "w":
        return Center(child: animatedText(context, "wicket", color: AppColor.liveDot));
      case "wd":
        return Center(child: animatedText(context, "wide ball", fontSize: context.sp(25)));
      case "nb":
        return Center(child: animatedText(context, "no ball", fontSize: context.sp(25)));
      case "OVER":
        return Center(child: animatedText(context, "OVER"));
      case "null":
        return Center(child: animatedText(context, ""));
      default:
        return Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Text(
              ball?.toUpperCase() ?? "",
              key: ValueKey(ball),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: tDmSans(context, fontSize: context.sp(22), fontWeight: FontWeight.bold, color: AppColor.text),
            ),
          ),
        );
    }
  }

  Widget animatedText(BuildContext context, String text, {Color? color, double? fontSize}) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: Text(
        key: ValueKey(text),
        text,
        textAlign: TextAlign.center,
        style: tDmSans(context, fontSize: fontSize ?? context.sp(35), fontWeight: FontWeight.bold, color: color ?? AppColor.text),
      ),
    );
  }
}

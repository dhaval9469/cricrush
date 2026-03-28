import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/widget/md_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MatchInfo extends StatelessWidget {
  MatchInfo({super.key});

  final mdCtrl = Get.find<MatchDetailsCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(() {
        final matchInfo = mdCtrl.scoreboardData.value?.matchdetail;
        return matchInfo?.venue == null
            ? Center(child: ED(text: "Data not available"))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.wp(3),
                        vertical: context.hp(1.5),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.card,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.wp(4),
                            vertical: context.hp(1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              matchVI(context, header: "Series", text: matchInfo?.series ?? ""),
                              Divider(color: AppColor.cDivider, height: context.hp(1.7)),
                              matchVI(
                                context,
                                header: "Match",
                                text: "${matchInfo?.team1} vs ${matchInfo?.team2}",
                              ),
                              Divider(color: AppColor.cDivider, height: context.hp(1.7)),
                              matchVI(
                                context,
                                header: "Toss",
                                text: (matchInfo?.tosswonby?.isNotEmpty ?? false)
                                    ? "${matchInfo?.tosswonby} won the toss "
                                          "and chose the ${matchInfo?.tossElectedTo}"
                                    : "",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.card,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.wp(4),
                            vertical: context.hp(1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              matchVI(
                                context,
                                header: "Date & Time",
                                text: "${matchInfo?.date} | ${matchInfo?.time}",
                              ),
                              Divider(color: AppColor.cDivider, height: context.hp(1.7)),
                              matchVI(context, header: "Venue", text: matchInfo?.venue?.name),

                              Divider(color: AppColor.cDivider, height: context.hp(1.7)),
                              matchVI(context, header: "Umpire", text: matchInfo?.umpires),

                              Divider(color: AppColor.cDivider, height: context.hp(1.7)),
                              matchVI(context, header: "Referee", text: matchInfo?.referee),
                            ],
                          ),
                        ),
                      ),
                    ),
                    (matchInfo?.weather?.isEmpty ?? false) || matchInfo?.weather == null
                        ? const SizedBox.shrink()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: context.wp(4),
                                  bottom: context.hp(1),
                                  top: context.hp(2.5),
                                ),
                                child: Text(
                                  "Weather Condition",
                                  style: stDmSans(
                                    context,
                                    color: AppColor.text,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.card,
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: context.wp(4),
                                            vertical: context.hp(1),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Text(
                                                    (matchInfo?.weather?.isEmpty ?? false) ||
                                                            matchInfo?.weather == null
                                                        ? ""
                                                        : "${matchInfo?.weather}",
                                                    style: tDmSans(
                                                      context,
                                                      fontSize: context.sp(13),
                                                    ),
                                                  ),

                                                  SizedBox(height: context.hp(0.3)),

                                                  (matchInfo
                                                                  ?.venue
                                                                  ?.venueWeather
                                                                  ?.temperature
                                                                  ?.isEmpty ??
                                                              false) ||
                                                          matchInfo
                                                                  ?.venue
                                                                  ?.venueWeather
                                                                  ?.temperature ==
                                                              null
                                                      ? const SizedBox.shrink()
                                                      : Text(
                                                          "${matchInfo?.venue?.venueWeather?.temperature}",
                                                          style: stBarlow(context),
                                                        ),
                                                ],
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.solidCloud,
                                                color: AppColor.text,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: context.wp(5)),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.card,
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: context.wp(4),
                                            vertical: context.hp(1),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Visibility",
                                                    style: tDmSans(
                                                      context,
                                                      fontSize: context.sp(13),
                                                    ),
                                                  ),

                                                  SizedBox(height: context.hp(0.3)),
                                                  Text(
                                                    matchInfo?.venue?.venueWeather?.visibility ==
                                                                "" ||
                                                            matchInfo
                                                                    ?.venue
                                                                    ?.venueWeather
                                                                    ?.visibility ==
                                                                null
                                                        ? ""
                                                        : matchInfo
                                                                  ?.venue
                                                                  ?.venueWeather
                                                                  ?.visibility ??
                                                              "",
                                                    style: stBarlow(context),
                                                  ),
                                                ],
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.cloudversify,
                                                color: AppColor.text,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.wp(3),
                                  vertical: context.hp(1),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.card,
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: context.wp(4),
                                            vertical: context.hp(1),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Text(
                                                    "Humidity",
                                                    style: tDmSans(
                                                      context,
                                                      fontSize: context.sp(13),
                                                    ),
                                                  ),

                                                  SizedBox(height: context.hp(0.3)),
                                                  Text(
                                                    (matchInfo
                                                                    ?.venue
                                                                    ?.venueWeather
                                                                    ?.humidity
                                                                    ?.isEmpty ??
                                                                false) ||
                                                            matchInfo
                                                                    ?.venue
                                                                    ?.venueWeather
                                                                    ?.humidity ==
                                                                null
                                                        ? ""
                                                        : "${matchInfo?.venue?.venueWeather?.humidity}",
                                                    style: stBarlow(context),
                                                  ),
                                                ],
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.droplet,
                                                color: AppColor.text,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: context.wp(5)),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.card,
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: context.wp(4),
                                            vertical: context.hp(1),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Wind",
                                                    style: tDmSans(
                                                      context,
                                                      fontSize: context.sp(13),
                                                    ),
                                                  ),

                                                  SizedBox(height: context.hp(0.3)),
                                                  Text(
                                                    (matchInfo
                                                                    ?.venue
                                                                    ?.venueWeather
                                                                    ?.windSpeed
                                                                    ?.isEmpty ??
                                                                false) ||
                                                            matchInfo
                                                                    ?.venue
                                                                    ?.venueWeather
                                                                    ?.windSpeed ==
                                                                "null"
                                                        ? ""
                                                        : matchInfo
                                                                  ?.venue
                                                                  ?.venueWeather
                                                                  ?.windSpeed ??
                                                              "",
                                                    style: stBarlow(context),
                                                  ),
                                                ],
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.wind,
                                                color: AppColor.text,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              );
      }),
    );
  }
}

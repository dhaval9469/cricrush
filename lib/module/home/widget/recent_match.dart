import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/home/model/all_match_model.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/common_widgets.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/time_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentMatch extends StatelessWidget {
  RecentMatch({super.key});

  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.allML.value
          ? AspectRatio(aspectRatio: 2.7, child: Center(child: CircularProgressIndicator()))
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: context.wp(4), bottom: context.hp(1), top: context.hp(1)),
                  child: Text(
                    "Matches",
                    style: stDmSans(context, color: AppColor.text, fontWeight: FontWeight.w600),
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: homeCtrl.recentMatches.length,
                  options: CarouselOptions(
                    aspectRatio: 2.7,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    enlargeFactor: 0.2,
                    onPageChanged: (index, reason) {
                      homeCtrl.hmcIndex.value = index;
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    double opacity = index == homeCtrl.hmcIndex.value ? 1.0 : 0.7;
                    final data = homeCtrl.recentMatches[index];
                    List<Innings> firstInnings = [];
                    List<Innings> secondInnings = [];
                    data.innings?.forEach((element) {
                      if (element.nameShort == data.teamlist?[0].nameShort) {
                        firstInnings.add(element);
                      } else {
                        secondInnings.add(element);
                      }
                    });
                    return Opacity(
                      opacity: opacity,
                      child: card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: padding(
                                horizontal: context.wp(3),
                                context,
                                data.type == "upcoming"
                                    ? Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${data.matchnumber}", style: stBarlow(context)),
                                          Text(
                                            "UPCOMING",
                                            style: stDmSans(
                                              context,
                                              color: AppColor.upcoming,
                                              fontSize: context.sp(13),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    : data.type == "results"
                                    ? Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${data.matchdetail?.match?.number}",
                                            style: stDmSans(context, fontSize: context.sp(13)),
                                          ),
                                          Text(
                                            "RESULT",
                                            style: stDmSans(
                                              context,
                                              fontSize: context.sp(13),
                                              color: AppColor.finished,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${data.matchdetail?.match?.number}, AT ${data.matchdetail?.match?.city}",
                                            style: stDmSans(context, fontSize: context.sp(13)),
                                          ),
                                          data.matchdetail?.status?.toLowerCase() == "play in progress"
                                              ? liveDot(context)
                                              : data.matchdetail?.status?.toLowerCase() == "match yet to begin"
                                              ? Text("YET TO BEGIN", style: stDmSans(context, fontSize: context.sp(13)))
                                              : Text(
                                                  data.matchdetail?.status ?? "",
                                                  style: stDmSans(
                                                    context,
                                                    fontSize: context.sp(13),
                                                    color: AppColor.status,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                        ],
                                      ),
                              ),
                            ),
                            Divider(height: 0, color: AppColor.cDivider),
                            padding(
                              vertical: context.hp(1.1),
                              context,
                              data.type == "upcoming"
                                  ? Row(
                                      children: [
                                        SizedBox(
                                          width: context.wp(50),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  showFlag(context: context, url: data.teamaImage ?? ""),
                                                  SizedBox(width: context.wp(3)),
                                                  Text(
                                                    "${data.teamaShort}",
                                                    style: tDmSans(context, fontWeight: FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: context.hp(1)),
                                              Row(
                                                children: [
                                                  showFlag(context: context, url: data.teambImage ?? ""),
                                                  SizedBox(width: context.wp(3)),
                                                  Text(
                                                    "${data.teambShort}",
                                                    style: tDmSans(context, fontWeight: FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        Expanded(
                                          child: Text(
                                            TimeManager.rmTime('${data.matchdateIst} ${data.matchtimeIst}'),
                                            textAlign: TextAlign.center,
                                            style: stBarlow(context),
                                          ),
                                        ),
                                      ],
                                    )
                                  : data.type == "results"
                                  ? Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: context.wp(50),
                                                  child: Row(
                                                    children: [
                                                      showFlag(context: context, url: data.teamlist?[0].teamImage ?? ""),
                                                      SizedBox(width: context.wp(3)),
                                                      Text(
                                                        "${data.teamlist?[0].nameShort}",
                                                        style: tDmSans(
                                                          context,
                                                          fontWeight: FontWeight.w600,
                                                          color: data.matchdetail?.win == data.teamlist?[0].nameShort
                                                              ? AppColor.text
                                                              : AppColor.subText,
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
                                                              fontWeight: data.matchdetail?.win == data.teamlist?[0].nameShort
                                                                  ? FontWeight.w600
                                                                  : FontWeight.w500,
                                                              color: data.matchdetail?.win == data.teamlist?[0].nameShort
                                                                  ? AppColor.winText
                                                                  : AppColor.subText,
                                                            ),
                                                          ),

                                                          Text(
                                                            "  (",
                                                            style: stBarlow(
                                                              context,
                                                              color: data.matchdetail?.win == data.teamlist?[0].nameShort
                                                                  ? AppColor.winText
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
                                                                color: data.matchdetail?.win == data.teamlist?[0].nameShort
                                                                    ? AppColor.winText
                                                                    : AppColor.subText,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            ")",
                                                            style: stBarlow(
                                                              context,
                                                              color: data.matchdetail?.win == data.teamlist?[0].nameShort
                                                                  ? AppColor.winText
                                                                  : AppColor.subText,
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
                                                  width: context.wp(50),
                                                  child: Row(
                                                    children: [
                                                      showFlag(context: context, url: data.teamlist?[1].teamImage ?? ""),
                                                      SizedBox(width: context.wp(3)),
                                                      Text(
                                                        "${data.teamlist?[1].nameShort}",
                                                        style: tDmSans(
                                                          context,
                                                          fontWeight: FontWeight.w600,
                                                          color: data.matchdetail?.win == data.teamlist?[1].nameShort
                                                              ? AppColor.text
                                                              : AppColor.subText,
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
                                                              fontWeight: data.matchdetail?.win == data.teamlist?[1].nameShort
                                                                  ? FontWeight.w600
                                                                  : FontWeight.w500,
                                                              color: data.matchdetail?.win == data.teamlist?[1].nameShort
                                                                  ? AppColor.winText
                                                                  : AppColor.subText,
                                                            ),
                                                          ),

                                                          Text(
                                                            "  (",
                                                            style: stBarlow(
                                                              context,
                                                              color: data.matchdetail?.win == data.teamlist?[1].nameShort
                                                                  ? AppColor.winText
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
                                                                color: data.matchdetail?.win == data.teamlist?[1].nameShort
                                                                    ? AppColor.winText
                                                                    : AppColor.subText,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            ")",
                                                            style: stBarlow(
                                                              context,
                                                              color: data.matchdetail?.win == data.teamlist?[1].nameShort
                                                                  ? AppColor.winText
                                                                  : AppColor.subText,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: context.wp(50),
                                                  child: Row(
                                                    children: [
                                                      showFlag(context: context, url: data.teamlist?[0].teamImage ?? ""),
                                                      SizedBox(width: context.wp(3)),
                                                      Text(
                                                        "${data.teamlist?[0].nameShort}",
                                                        style: tDmSans(context, fontWeight: FontWeight.w600),
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
                                                              fontWeight: firstInnings.last.batting == true
                                                                  ? FontWeight.w600
                                                                  : FontWeight.w500,
                                                              color: firstInnings.last.batting == true
                                                                  ? AppColor.text
                                                                  : AppColor.subText,
                                                            ),
                                                          ),

                                                          Text("  (", style: stBarlow(context)),
                                                          Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                                                            child: Text(
                                                              "${firstInnings.last.overs}",
                                                              style: stBarlow(context, fontSize: context.sp(13)),
                                                            ),
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
                                                  width: context.wp(50),
                                                  child: Row(
                                                    children: [
                                                      showFlag(context: context, url: data.teamlist?[1].teamImage ?? ""),
                                                      SizedBox(width: context.wp(3)),
                                                      Text(
                                                        "${data.teamlist?[1].nameShort}",
                                                        style: tDmSans(context, fontWeight: FontWeight.w600),
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
                                                              fontWeight: secondInnings.last.batting == true
                                                                  ? FontWeight.w600
                                                                  : FontWeight.w500,
                                                              color: secondInnings.last.batting == true
                                                                  ? AppColor.text
                                                                  : AppColor.subText,
                                                            ),
                                                          ),

                                                          Text("  (", style: stBarlow(context)),
                                                          Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: context.sp(1)),
                                                            child: Text(
                                                              "${secondInnings.last.overs}",
                                                              style: stBarlow(context, fontSize: context.sp(13)),
                                                            ),
                                                          ),
                                                          Text(")", style: stBarlow(context)),
                                                        ],
                                                      ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                            ),

                            Divider(height: 0, color: AppColor.cDivider),
                            Flexible(
                              child: padding(
                                context,
                                data.type == "upcoming"
                                    ? Text(
                                        data.venue ?? "",
                                        maxLines: 1,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: stDmSans(context, fontSize: context.sp(12)),
                                      )
                                    : data.type == "results"
                                    ? Text(
                                        data.matchdetail?.result ?? "",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: stDmSans(context, fontSize: context.sp(12)),
                                      )
                                    : Text(
                                        (data.matchdetail?.equation != null && data.matchdetail!.equation!.isNotEmpty)
                                            ? data.matchdetail!.equation!
                                            : (data.matchdetail?.venue?.name ?? ""),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: stDmSans(context, fontSize: context.sp(12)),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: context.hp(1)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(homeCtrl.recentMatches.length, (index) {
                    bool isActive = index == homeCtrl.hmcIndex.value;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 6,
                      width: isActive ? 20 : 6,
                      decoration: BoxDecoration(
                        color: isActive ? AppColor.subText : AppColor.textHint,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    );
                  }),
                ),
              ],
            ),
    );
  }
}

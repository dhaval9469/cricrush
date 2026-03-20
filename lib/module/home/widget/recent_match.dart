import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/home/model/all_match_model.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/common_widgets.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentMatch extends StatelessWidget {
  RecentMatch({super.key});

  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          itemCount: homeCtrl.recentMatches.length,
          options: CarouselOptions(
            aspectRatio: 2.5,
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
                    horizontalPadding(
                      context,
                      data.type == "upcoming"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${data.matchnumber}, AT ${data.city}", style: stBarlow(context)),
                                Text("${data.type}", style: stBarlow(context)),
                              ],
                            )
                          : data.type == "results"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${data.matchdetail?.match?.number}, AT ${data.matchdetail?.match?.city}",
                                  style: stBarlow(context),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${data.matchdetail?.match?.number}, AT ${data.matchdetail?.match?.city}",
                                  style: stBarlow(context),
                                ),
                                data.matchdetail?.status?.toLowerCase() == "play in progress"
                                    ? liveDot(context)
                                    : data.matchdetail?.status?.toLowerCase() == "match yet to begin"
                                    ? Text("YET TO BEGIN", style: stBarlow(context))
                                    : Text(data.matchdetail?.status ?? "", style: stBarlow(context, color: AppColor.finished)),
                              ],
                            ),
                    ),
                    Divider(height: 0, color: AppColor.cDivider),
                    horizontalPadding(
                      context,
                      data.type == "upcoming"
                          ? SizedBox(
                              height: context.hp(10),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: context.wp(55),
                                        child: Row(
                                          children: [
                                            showFlag(context: context, url: data.teamaImage ?? ""),
                                            SizedBox(width: context.sp(10)),
                                            Text("${data.teamaShort}", style: tDmSans(context)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: context.sp(7)),
                                      SizedBox(
                                        width: context.wp(55),
                                        child: Row(
                                          children: [
                                            showFlag(context: context, url: data.teambImage ?? ""),
                                            SizedBox(width: context.sp(10)),
                                            Text("${data.teambShort}", style: tDmSans(context)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // VerticalDivider(
                                  //   endIndent: context.sp(7),
                                  //   indent: context.sp(7),
                                  //   color: Theme.of(context).dividerColor,
                                  //   thickness: 1,
                                  // ),
                                  // Expanded(
                                  //   child: Text(
                                  //     TimeManager.formatMatchDateTime('${data.matchdateIst} ${data.matchtimeIst}'),
                                  //     textAlign: TextAlign.center,
                                  //     style: textMontserrat(
                                  //       context,
                                  //       fontWeight: FontWeight.w600,
                                  //       color: Theme.of(context).colorScheme.onPrimary,
                                  //       height: 0,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            )
                          : SizedBox(),
                    ),

                    Divider(height: 0, color: AppColor.cDivider),
                    horizontalPadding(
                      context,
                      data.type == "upcoming"
                          ? Text(
                              data.venue ?? "",
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: stBarlow(context, fontSize: context.sp(12)),
                            )
                          : data.type == "results"
                          ? Text(
                              data.matchdetail?.result ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: stBarlow(context, fontSize: context.sp(12)),
                            )
                          : Text(
                              (data.matchdetail?.equation != null && data.matchdetail!.equation!.isNotEmpty)
                                  ? data.matchdetail!.equation!
                                  : (data.matchdetail?.venue?.name ?? ""),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: stBarlow(context, fontSize: context.sp(12)),
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

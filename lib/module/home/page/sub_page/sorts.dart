import 'package:cricrush/ad_module/banner/banner_ad.dart';
import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/ad_module/native/big_native.dart';
import 'package:cricrush/ad_module/native/small_native.dart';
import 'package:cricrush/module/home/ctrl/sorts_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/time_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class SortsPage extends StatefulWidget {
  const SortsPage({super.key});

  @override
  State<SortsPage> createState() => _SortsPageState();
}

class _SortsPageState extends State<SortsPage> {
  final sortsCtrl = Get.find<SortsCtrl>();
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: sortsCtrl.sortIndex.value);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) return;
        Interstitial.showInterstitialByBackCount();
        Navigation.pop();
      },
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(backgroundColor: AppColor.background, toolbarHeight: 0),
        body: SafeArea(
          child: PageView.builder(
            controller: pageController,
            itemCount: sortsCtrl.shortsList.length,
            scrollDirection: Axis.vertical,
            onPageChanged: (page) {
              sortsCtrl.scIndex.value = page;
            },
            itemBuilder: (context, index) {
              final data = sortsCtrl.shortsList[index];
              return data.adsShow == 1
                  ? FullNativeBAd()
                  : data.sortType == "video"
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: context.wp(3.5), top: context.hp(1)),
                            child: GestureDetector(
                              onTap: () {
                                Interstitial.showInterstitialByBackCount();
                                Navigation.pop();
                              },
                              child: FaIcon(
                                FontAwesomeIcons.xmark,
                                color: AppColor.subText.withValues(alpha: 0.5),
                                size: context.sp(20),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomRight,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(data.image2 ?? "")),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(right: context.wp(3)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (data.checkLick?.value == false) {
                                          data.checkLick?.value = true;
                                          data.like = (data.like != null) ? data.like! + 1 : 1;
                                        } else {
                                          data.checkLick?.value = false;
                                          data.like = (data.like != null) ? data.like! - 1 : 1;
                                        }
                                      },
                                      child: FaIcon(
                                        data.checkLick?.value == true
                                            ? FontAwesomeIcons.solidHeart
                                            : FontAwesomeIcons.heart,
                                        color: data.checkLick?.value == true
                                            ? AppColor.liveDot
                                            : AppColor.text,
                                        size: context.sp(22),
                                      ),
                                    ),
                                  ),
                                  Text(formatLickCount(data.like ?? 0), style: tBarlow(context)),
                                  SizedBox(height: context.hp(1.3)),
                                  GestureDetector(
                                    onTap: () {
                                      SharePlus.instance.share(
                                        ShareParams(text: AppConfig.appShareText),
                                      );
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.solidShareFromSquare,
                                      color: AppColor.text,
                                      size: context.sp(25),
                                    ),
                                  ),
                                  SizedBox(height: context.hp(15)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: AppColor.card),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.wp(4),
                                vertical: context.hp(1),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${data.title}",
                                        style: tDmSans(context, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        TimeManager.setSortTime(data.dateTime.toString()),
                                        style: stBarlow(context, fontSize: context.sp(13)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: context.hp(0.7)),
                                  Text(
                                    "${data.description}",
                                    style: stBarlow(context, fontSize: context.sp(13)),
                                  ),
                                  SizedBox(height: context.hp(0.7)),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF363B49),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: AppColor.tDivider),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: context.wp(2),
                                            right: context.wp(2),
                                            top: context.hp(0.4),
                                            bottom: context.hp(0.5),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Credit:",
                                                style: stBarlow(context),
                                                strutStyle: const StrutStyle(
                                                  height: 1,
                                                  forceStrutHeight: true,
                                                ),
                                              ),
                                              SizedBox(width: context.wp(1.5)),
                                              FaIcon(
                                                FontAwesomeIcons.squareXTwitter,
                                                size: context.sp(18),
                                                color: AppColor.subText,
                                              ),
                                              if (data.credit?.isNotEmpty ?? false)
                                                Row(
                                                  children: [
                                                    SizedBox(width: context.wp(1.5)),
                                                    Text(
                                                      "&",
                                                      style: stBarlow(context),
                                                      strutStyle: const StrutStyle(
                                                        height: 1,
                                                        forceStrutHeight: true,
                                                      ),
                                                    ),
                                                    SizedBox(width: context.wp(1.5)),
                                                    Text(
                                                      "${data.credit}",
                                                      style: stBarlow(context),
                                                      strutStyle: const StrutStyle(
                                                        height: 1,
                                                        forceStrutHeight: true,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: context.hp(2)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Obx(
            () =>
                sortsCtrl.scIndex.value != 0 &&
                    sortsCtrl.scIndex.value % (AppConfig.unitIdModel?.sortIndex ?? 0) == 0
                ? const SizedBox.shrink()
                : const BannerAds(),
          ),
        ),
      ),
    );
  }

  Widget shortsShimmer(BuildContext context) {
    final baseColor = const Color(0xFF2A2F3A);
    final highlightColor = const Color(0xFF3A4250);

    return Container(
      height: context.hp(25),
      width: context.wp(40),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(color: const Color(0xFF2A2F3A)),
        ),
      ),
    );
  }

  String formatLickCount(int count) {
    if (count >= 1000) {
      double formatted = count / 1000;
      if (formatted == formatted.toInt()) {
        return '${formatted.toInt()}k';
      } else {
        return '${formatted.toStringAsFixed(2).replaceAll(RegExp(r'\.0'), '')}k';
      }
    } else {
      return count.toString();
    }
  }
}

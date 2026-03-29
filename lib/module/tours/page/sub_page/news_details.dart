import 'package:cricrush/ad_module/banner/banner_ad.dart';
import 'package:cricrush/ad_module/banner/large_banner.dart';
import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/time_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  final tourCtrl = Get.find<ToursCtrl>();

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: context.wp(4), top: context.hp(1)),
                  child: GestureDetector(
                    onTap: () {
                      Interstitial.showInterstitialByBackCount();
                      Navigation.pop();
                    },
                    child: FaIcon(FontAwesomeIcons.xmark, color: AppColor.subText.withValues(alpha: 0.5), size: context.sp(20)),
                  ),
                ),
              ),
              SizedBox(height: context.hp(1)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                child: Text(tourCtrl.newsTitle.value, style: tBarlow(context, fontWeight: FontWeight.w600)),
              ),
              Center(child: LargeBannerAd(padding: EdgeInsets.only(top: context.hp(1.3)),)),
              SizedBox(height: context.hp(1.3)),
              Hero(
                tag: tourCtrl.newsURLToImage.value,
                child: tourCtrl.newsURLToImage.value.isEmpty
                    ? Image.asset("", fit: BoxFit.cover)
                    : showPlayer(
                        context: context,
                        url: tourCtrl.newsURLToImage.value,
                        h: context.wp(15),
                        w: context.wp(30),
                        r: 1,
                      ),
              ),
              SizedBox(height: context.hp(0.7)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                child: Text(TimeManager.newsTimeTO(tourCtrl.publishedAT.value), style: stBarlow(context)),
              ),
              Html(
                data: tourCtrl.newsDescription.value,
                style: {
                  "body": Style(
                    fontSize: FontSize(context.sp(15)),
                    lineHeight: const LineHeight(1.3),
                    color: AppColor.text,
                    fontFamily: 'Barlow',
                  ),
                  "h1": Style(fontSize: FontSize(context.sp(15)), color: AppColor.text, fontFamily: 'Barlow'),
                  "h2": Style(
                    fontSize: FontSize(context.sp(15)),
                    lineHeight: const LineHeight(1.5),
                    color: AppColor.text,
                    fontFamily: 'Barlow',
                  ),
                  "h3": Style(
                    fontSize: FontSize(context.sp(15)),
                    color: AppColor.text,
                    fontFamily: 'Barlow',
                    lineHeight: const LineHeight(1.5),
                  ),
                  "p": Style(
                    margin: Margins.only(bottom: 14),
                    color: AppColor.subText,
                    fontSize: FontSize(context.sp(14)),
                    fontFamily: 'Barlow',
                    lineHeight: const LineHeight(1.5),
                  ),
                  "b": Style(
                    fontWeight: FontWeight.bold,
                    color: AppColor.subText,
                    fontSize: FontSize(context.sp(14)),
                    lineHeight: const LineHeight(1.5),
                    fontFamily: 'Barlow',
                  ),
                },
              ),
              SizedBox(height: context.hp(3)),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(child: BannerAds()),
      ),
    );
  }
}

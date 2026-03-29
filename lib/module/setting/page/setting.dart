import 'package:cricrush/ad_module/banner/banner_ad.dart';
import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/module/setting/ctrl/setting_ctrl.dart';
import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final setting = Get.put(SettingCtrl());
  double? setRating = 2.0;

  PackageInfo packageInfo = PackageInfo(appName: '', packageName: '', version: '', buildNumber: '', buildSignature: '');

  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: CustomAppBar(
        backgroundColor: AppColor.card,
        toolbarHeight: context.hp(5),
        title: Text(
          "Setting",
          style: tDmSans(context, fontSize: context.sp(17), fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: context.hp(1.5)),
          settingItem(
            onTap: () {
              Interstitial.showInterstitialByCount();
              Navigation.pushNamed(Routes.playerRanking);
            },
            assetName: AppAssets.ranking,
            text: "Player Ranking",
            subText: "Top-ranked batters, bowlers and all-rounders",
          ),
          settingItem(
            onTap: () {
              Interstitial.showInterstitialByCount();

              Navigation.pushNamed(Routes.teamRanking);
            },
            assetName: AppAssets.rTeam,
            text: "Team Ranking",
            subText: "Latest ICC rankings for international teams",
          ),
          settingItem(
            onTap: () {
              Interstitial.showInterstitialByCount();

              Navigation.pushNamed(Routes.notificationS);
            },
            assetName: AppAssets.bell,
            text: "Notification Setting",
            subText: "Customize live match and news alerts",
          ),
          settingItem(
            onTap: () async {
              await appRating(context: context);
            },
            assetName: AppAssets.rateUs,
            text: "Rate Us",
            subText: "Share your feedback and rate the app",
          ),
          settingItem(
            onTap: () {
              SharePlus.instance.share(ShareParams(text: AppConfig.appShareText));
            },
            assetName: AppAssets.share,
            text: "Share App",
            subText: "Invite friends and share the app with others",
          ),
          settingItem(
            onTap: () {
              Interstitial.showInterstitialByCount();

              Navigation.pushNamed(Routes.privacyPolicy);
            },
            assetName: AppAssets.pp,
            text: "Privacy Policy",
            subText: "View our privacy and data protection policy",
          ),
        ],
      ),
      bottomNavigationBar: BannerAds(),
    );
  }

  Widget settingItem({GestureTapCallback? onTap, String? assetName, String? text, String? subText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.wp(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(
                      assetName ?? "",
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      height: context.sp(22),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$text", style: tDmSans(context)),
                    Text("$subText", style: stBarlow(context, fontSize: context.sp(12))),
                  ],
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios, size: context.sp(18), color: AppColor.subText),
              ],
            ),
            Row(
              children: [
                SizedBox(width: context.wp(10)),
                Expanded(
                  child: Divider(color: AppColor.tDivider, height: context.hp(3)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> appRating({required BuildContext context}) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: context.wp(5)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: context.hp(2), horizontal: context.wp(5)),
                decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "CricFlow",
                      style: tDmSans(context, fontSize: context.sp(17), fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: context.hp(1)),

                    Text(
                      "We value your opinion.\nShare your experience with ${packageInfo.appName} and help us deliver a better cricket experience.",
                      textAlign: TextAlign.center,
                      style: stBarlow(context, fontSize: context.sp(15)),
                    ),

                    SizedBox(height: context.hp(2)),

                    RatingBar.builder(
                      initialRating: setRating ?? 0.0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 35,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 6),

                      itemBuilder: (context, index) {
                        return const Icon(Icons.star_rounded, color: Color(0xFFFFC107));
                      },
                      onRatingUpdate: (rating) {
                        setState(() {
                          setRating = rating;
                        });
                      },
                    ),

                    SizedBox(height: context.hp(2)),

                    GestureDetector(
                      onTap: () async {
                        final rating = setRating ?? 0;

                        if (rating == 0) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(const SnackBar(content: Text("Please select a rating first")));
                          return;
                        }

                        Navigation.pop();

                        if (rating >= 3) {
                          final Uri url = Uri.parse("https://flutter.dev/");

                          if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                            throw Exception('Could not launch $url');
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Thanks for your feedback!")));
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: AppColor.sTabColor, borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                          child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: tDmSans(context, fontSize: context.sp(18), fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

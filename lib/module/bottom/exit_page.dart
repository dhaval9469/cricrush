import 'dart:io';

import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/ad_module/native/big_native.dart';
import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ExitPage extends StatelessWidget {
  const ExitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(backgroundColor: AppColor.background, toolbarHeight: 0),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: context.wp(5), top: context.hp(3)),
                child: GestureDetector(
                  onTap: () {
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
            SizedBox(height: context.hp(7)),
            Image.asset(AppAssets.dFlag, scale: 5),
            SizedBox(height: context.hp(0.5)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
              child: Text(
                "LIVESCORE CRICKET",
                textAlign: TextAlign.center,
                style: GoogleFonts.rajdhani(
                  color: AppColor.text,
                  fontWeight: FontWeight.bold,
                  fontSize: context.sp(30),
                  fontStyle: FontStyle.italic,
                  height: 1.2,
                  letterSpacing: 2,
                ),
              ),
            ),
            SizedBox(height: context.hp(1)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
              child: Text(
                "Never miss a moment of the match. Get live cricket scores, updates, and match action anytime.",
                textAlign: TextAlign.center,
                style: stDmSans(context),
              ),
            ),
            SizedBox(height: context.hp(5)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
              child: GestureDetector(
                onTap: () {
                  Navigation.pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.button,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Stay for Live Scores",
                          style: tDmSans(
                            context,
                            fontWeight: FontWeight.w900,
                            fontSize: context.sp(18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: context.hp(3)),
            FullNativeBAd(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: GestureDetector(
          onTap: () {
            exit(0);
          },
          child: Container(
            decoration: BoxDecoration(color: AppColor.card),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: context.hp(1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tap to Exit",
                    style: tDmSans(context, fontWeight: FontWeight.w900, fontSize: context.sp(18)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

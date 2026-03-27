import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(backgroundColor: AppColor.background, toolbarHeight: 0),
      body: Column(
        children: [
          SizedBox(height: context.hp(5)),
          Text(
            "CRICRUSH",
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
          Expanded(child: Center(child: Image.asset(AppAssets.fIntro))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(7)),
            child: Text(
              "Step Into CricRush",
              style: tDmSans(context, fontSize: context.sp(20), fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(7)),
            child: Text("Discover cricket matches and scores.", textAlign: TextAlign.center, style: stDmSans(context)),
          ),
          SizedBox(height: context.hp(5)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(7)),
            child: GestureDetector(
              onTap: () {
                Navigation.pushNamed(Routes.introPage);
              },
              child: Container(
                decoration: BoxDecoration(color: AppColor.button, borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get Started",
                        style: tDmSans(context, fontSize: context.sp(18), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: context.hp(10)),
        ],
      ),
    );
  }
}

import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';

class SIntro extends StatelessWidget {
  const SIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(backgroundColor: AppColor.background, toolbarHeight: 0),
      body: Column(
        children: [
          SizedBox(height: context.hp(7)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.wp(10)),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.background,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: AppColor.tDivider),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.wp(7), vertical: context.hp(5)),
                        child: Text(
                          "Live Scores, Instantly",
                          textAlign: TextAlign.center,
                          style: tDmSans(context, fontSize: context.sp(18), fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Center(child: Image.asset(AppAssets.iS))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.wp(7), vertical: context.hp(5)),
                        child: Text(
                          "Get real-time cricket scores and match updates as the action unfolds.",
                          textAlign: TextAlign.center,
                          style: stDmSans(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: context.hp(13)),
        ],
      ),
    );
  }
}

import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';

class DL extends StatelessWidget {
  const DL({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      strokeWidth: 3,
      backgroundColor: AppColor.tDivider,
      valueColor: AlwaysStoppedAnimation<Color>(AppColor.text),
    );
  }
}

class ED extends StatelessWidget {
  final String text;

  const ED({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppAssets.mdf, color: AppColor.textHint),
          Text(
            text,
            style: stDmSans(context, fontSize: context.sp(15), color: AppColor.textHint),
          ),
        ],
      ),
    );
  }
}

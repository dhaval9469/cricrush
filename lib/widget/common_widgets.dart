import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';

Widget card({final Widget? child}) {
  return Container(
    decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(12)),
    child: child,
  );
}

Widget liveDot(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColor.liveDot),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: context.wp(2.5), vertical: context.hp(0.5)),
      child: Row(
        children: [
          Container(
            height: context.sp(10),
            width: context.sp(10),
            decoration: BoxDecoration(color: AppColor.white.withAlpha(150), shape: BoxShape.circle),
            child: Padding(
              padding: EdgeInsets.all(context.sp(2.5)),
              child: Container(
                decoration: BoxDecoration(color: AppColor.white, shape: BoxShape.circle),
              ),
            ),
          ),
          SizedBox(width: context.wp(1.5)),
          Text(
            "LIVE",
            style: tDmSans(
              context,
              color: AppColor.white,
              fontWeight: FontWeight.w900,
              fontSize: context.sp(13),
            ),
            strutStyle: const StrutStyle(height: 1, forceStrutHeight: true),
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
          ),
        ],
      ),
    ),
  );
}

class GlowProgressBar extends StatelessWidget {
  final double progress;

  const GlowProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(50)),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 6, spreadRadius: 2)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

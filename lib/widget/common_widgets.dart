import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/cupertino.dart';

Widget card({final Widget? child}) {
  return Container(
    decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(16)),
    child: child,
  );
}

Widget liveDot(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColor.liveDot),
    child: Padding(
      padding: EdgeInsets.only(left: context.sp(10), right: context.sp(10), top: context.sp(4), bottom: context.sp(5)),
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
            style: tDmSans(context, color: AppColor.white, fontWeight: FontWeight.w900, fontSize: context.sp(13), height: 1),
          ),
        ],
      ),
    ),
  );
}

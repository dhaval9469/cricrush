import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle tBarlow(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? height,
}) {
  return GoogleFonts.barlow(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(15),
    height: height,
  );
}

TextStyle tDmSans(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? height,
}) {
  return GoogleFonts.dmSans(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(15),
    height: height,
  );
}

TextStyle stBarlow(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? height,
}) {
  return GoogleFonts.barlow(
    color: color ?? AppColor.subText,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(14),
    height: height,
  );
}

TextStyle stDmSans(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? height,
}) {
  return GoogleFonts.dmSans(
    color: color ?? AppColor.subText,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(14),
    height: height,
  );
}

Widget padding(
  BuildContext context,
  Widget? child, {
  double? horizontal,
  double? vertical,
  bool isHorizontal = false,
  bool isVertical = false,
}) {
  return isHorizontal
      ? Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontal ?? context.wp(3)),
          child: child,
        )
      : isVertical
      ? Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontal ?? context.wp(3)),
          child: child,
        )
      : Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal ?? context.wp(3),
            vertical: vertical ?? context.hp(1),
          ),
          child: child,
        );
}

TextStyle tabLabelTextStyle(BuildContext context) {
  return tBarlow(context, fontSize: context.sp(16), fontWeight: FontWeight.bold);
}

TextStyle tabUnLabelTextStyle(BuildContext context) {
  return stBarlow(context, fontSize: context.sp(14));
}

TextStyle scHeaderStyle(BuildContext context) => stDmSans(context, fontSize: context.sp(13));

TextStyle lbStyle(BuildContext context) => stBarlow(context);

import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle tBarlow(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color, double? height}) {
  return GoogleFonts.barlow(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(15),
    height: height,
  );
}

TextStyle tDmSans(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color, double? height}) {
  return GoogleFonts.dmSans(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(15),
    height: height,
  );
}

TextStyle stBarlow(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color, double? height}) {
  return GoogleFonts.barlow(
    color: color ?? AppColor.subText,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(14),
    height: height,
  );
}

TextStyle stDmSans(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color, double? height}) {
  return GoogleFonts.dmSans(
    color: color ?? AppColor.subText,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(14),
    height: height,
  );
}

Widget horizontalPadding(BuildContext context, Widget? child) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(1)),
    child: child,
  );
}

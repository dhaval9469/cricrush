import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';

Widget commonTab(BuildContext context, {required String title}) {
  return Tab(
    height: context.hp(4),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
      child: Text(title),
    ),
  );
}

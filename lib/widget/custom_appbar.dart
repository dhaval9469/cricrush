import 'package:cricrush/res/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final String? text;
  final Widget? title;
  final double? height;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final bool isTabAppbar;

  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.text,
    this.bottom,
    this.height,
    this.title,
    this.toolbarHeight,
    this.isTabAppbar = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: backgroundColor ?? AppColor.background, automaticallyImplyLeading: false, toolbarHeight: 0);
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}

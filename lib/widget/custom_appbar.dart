import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final String? text;
  final Widget? title;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final bool isBackAppbar;
  final double? titleSpacing;

  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.text,
    this.bottom,
    this.title,
    this.toolbarHeight,
    this.titleSpacing,
    this.isBackAppbar = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColor.background,
      automaticallyImplyLeading: false,
      titleSpacing: titleSpacing ?? 15,
      leading: isBackAppbar
          ? GestureDetector(
              onTap: () {
                Interstitial.showInterstitialByBackCount();
                Navigation.pop();
              },
              child: Image.asset(AppAssets.back, color: AppColor.text, scale: 20),
            )
          : null,
      title: title ?? (text != null ? Text(text!, style: const TextStyle(fontWeight: FontWeight.w600)) : null),
      centerTitle: true,

      bottom:
          bottom ??
          PreferredSize(
            preferredSize: Size.fromHeight(context.sp(1)),
            child: Divider(color: AppColor.tDivider, height: 0),
          ),

      toolbarHeight: toolbarHeight ?? kToolbarHeight,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0));
}

/*class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final String? text;
  final Widget? title;
  final double? height;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final bool isBackAppbar;

  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.text,
    this.bottom,
    this.height,
    this.title,
    this.toolbarHeight,
    this.isBackAppbar = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColor.background,
      automaticallyImplyLeading: false,
      toolbarHeight: toolbarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? 0);
}*/

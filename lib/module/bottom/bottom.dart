import 'package:cricrush/module/home/page/home.dart';
import 'package:cricrush/module/schedule/page/schedule.dart';
import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

final pages = [HomePage(), SchedulePage(), HomePage(), HomePage(), HomePage()];

class _BottomPageState extends State<BottomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: ValueListenableBuilder(
        valueListenable: AppConfig.bottomIndex,
        builder: (context, value, child) {
          return pages[value];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: AppConfig.bottomIndex,
        builder: (context, value, child) {
          return BottomNavigationBar(
            backgroundColor: AppColor.card,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.text,
            unselectedItemColor: AppColor.subText,
            selectedLabelStyle: tBarlow(
              context,
              fontWeight: FontWeight.w600,
              fontSize: AppConfig.bottomIndex.value == 2 ? context.sp(10) : context.sp(15),
              color: AppColor.text,
            ),
            unselectedLabelStyle: stBarlow(context, fontSize: context.sp(13)),
            currentIndex: value,
            onTap: (value) async {
              AppConfig.bottomIndex.value = value;
            },
            items: [
              _navItem(AppAssets.home, AppAssets.homeS, "Home", 0),
              _navItem(AppAssets.home, AppAssets.homeS, "Schedule", 1),
              _navItem(AppAssets.home, AppAssets.homeS, "Series", 2),
              _navItem(AppAssets.home, AppAssets.homeS, "Fixtures", 3),
              _navItem(AppAssets.home, AppAssets.homeS, "More", 4),
            ],
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _navItem(String icon, String selectedIcon, String label, int index) {
    final isSelected = AppConfig.bottomIndex.value == index;

    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 7),
        child: AnimatedScale(
          scale: isSelected ? 1.25 : 1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCubic,
          child: Image.asset(
            isSelected ? selectedIcon : icon,
            width: 22,
            height: 22,
            color: isSelected ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF).withAlpha(180),
          ),
        ),
      ),
      label: label,
    );
  }
}

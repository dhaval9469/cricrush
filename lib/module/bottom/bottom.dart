import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/home/page/home.dart';
import 'package:cricrush/module/schedule/page/schedule.dart';
import 'package:cricrush/module/setting/page/setting.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/module/tours/page/tours.dart';
import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

final tourCtrl = Get.find<ToursCtrl>();
final homeCtrl = Get.find<HomeCtrl>();

final pages = [HomePage(), SchedulePage(), ToursPage(), Setting()];

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
          return Obx(
            () => BottomNavigationBar(
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
                if (value == 0 || value == 1) {
                  homeCtrl.getAllMatch(silentRefresh: true);
                }
              },
              items: [
                _navItem(AppAssets.home, AppAssets.homes, "Home", 0),
                _navItem(AppAssets.schedule, AppAssets.schedules, "Schedule", 1),
                _navItem(AppAssets.series, AppAssets.seriess, tourCtrl.tFooter.value, 2),
                _navItem(AppAssets.setting, AppAssets.settings, "Setting", 3),
              ],
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _navItem(String icon, String selectedIcon, String label, int index) {
    final isSelected = AppConfig.bottomIndex.value == index;
    return BottomNavigationBarItem(
      icon: AnimatedScale(
        scale: isSelected ? 1.25 : 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOutCubic,
        child: Image.asset(
          isSelected ? selectedIcon : icon,
          scale: 20,
          color: isSelected ? AppColor.text : AppColor.subText,
        ),
      ),
      label: label,
    );
  }
}

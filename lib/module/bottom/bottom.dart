import 'package:cricrush/module/home/page/home.dart';
import 'package:cricrush/module/schedule/page/schedule.dart';
import 'package:cricrush/module/setting/page/setting.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/module/tours/page/tours.dart';
import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:cricrush/utils/notification_services.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  final tourCtrl = Get.find<ToursCtrl>();
  final pages = [HomePage(), SchedulePage(), ToursPage(), Setting()];

  AppUpdateInfo? _updateInfo;


  @override
  void initState() {
    // _setupAppStateListener();
    init();
    super.initState();
  }

  Future<void> init() async {
    await NotificationService.instance.init();
    await checkForUpdate();
  }

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
            () => Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
              child: Container(
                height: context.hp(10),
                decoration: BoxDecoration(color: AppColor.card),
                child: BottomNavigationBar(
                  backgroundColor: AppColor.card,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColor.text,
                  unselectedItemColor: AppColor.subText,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedLabelStyle: TextStyle(fontSize: 0),
                  unselectedLabelStyle: TextStyle(fontSize: 0),
                  currentIndex: value,
                  onTap: (value) async {
                    AppConfig.bottomIndex.value = value;
                  },
                  items: [
                    _navItem(
                      context: context,
                      icon: AppAssets.home,
                      selectedIcon: AppAssets.homes,
                      label: "Home",
                      index: 0,
                      currentIndex: value,
                    ),
                    _navItem(
                      context: context,
                      icon: AppAssets.schedule,
                      selectedIcon: AppAssets.schedules,
                      label: "Schedule",
                      index: 1,
                      currentIndex: value,
                    ),
                    _navItem(
                      context: context,
                      icon: AppAssets.series,
                      selectedIcon: AppAssets.seriess,
                      label: tourCtrl.tFooter.value,
                      index: 2,
                      currentIndex: value,
                    ),
                    _navItem(
                      context: context,
                      icon: AppAssets.setting,
                      selectedIcon: AppAssets.settings,
                      label: "Setting",
                      index: 3,
                      currentIndex: value,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _navItem({
    required BuildContext context,
    required String icon,
    required String selectedIcon,
    required String label,
    required int index,
    required int currentIndex,
  }) {
    final isSelected = currentIndex == index;

    return BottomNavigationBarItem(
      label: "",
      icon: Padding(
        padding: EdgeInsets.only(top: context.sp(7)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedPadding(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.only(bottom: isSelected ? 4 : 0),
              child: AnimatedScale(
                scale: isSelected ? 1.2 : 1,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOutCubic,
                child: Image.asset(
                  isSelected ? selectedIcon : icon,
                  scale: 20,
                  color: isSelected ? AppColor.text : AppColor.subText,
                ),
              ),
            ),
            SizedBox(height: context.sp(isSelected ? 0 : 2)),
            Text(
              label,
              style: TextStyle(
                fontSize: index == 2
                    ? (isSelected ? context.sp(10) : context.sp(9))
                    : (isSelected ? context.sp(15) : context.sp(13)),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColor.text : AppColor.subText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkForUpdate() async {
    try {
      AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();
      setState(() {
        _updateInfo = updateInfo;
      });

      if (_updateInfo?.updateAvailability == UpdateAvailability.updateAvailable) {
        if (_updateInfo!.immediateUpdateAllowed) {
          InAppUpdate.performImmediateUpdate();
        } else if (_updateInfo!.flexibleUpdateAllowed) {
          InAppUpdate.startFlexibleUpdate().then((_) {
            InAppUpdate.completeFlexibleUpdate();
          });
        }
      }
    } catch (e) {
      return;
    }
  }
}

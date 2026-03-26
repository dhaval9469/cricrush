import 'package:cricrush/helper/local_storage_service.dart';
import 'package:cricrush/module/setting/ctrl/setting_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationS extends StatelessWidget {
  NotificationS({super.key});

  final setting = Get.find<SettingCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: CustomAppBar(
        isBackAppbar: true,
        backgroundColor: AppColor.card,
        toolbarHeight: context.hp(5),
        title: Text(
          "Notifications",
          style: tDmSans(context, fontSize: context.sp(17), fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            SizedBox(height: context.hp(1.5)),
            ranking(
              context,
              text: "All Notifications",
              subText: "Enable or disable all app notifications",
              value: setting.allNotification.value,
              onChanged: (val) {
                setting.allNotification.value = val;
                AppPref().write(AppConfig.allN, setting.allNotification.value);
              },
            ),
            ranking(
              context,
              text: "Live Match Alerts",
              subText: "Get notified when match goes live",
              value: setting.lmaNotification.value,
              onChanged: (val) {
                setting.lmaNotification.value = val;
                AppPref().write(AppConfig.lmaN, setting.lmaNotification.value);
              },
            ),
            ranking(
              context,
              text: "Live Match update",
              subText: "wickets, 50s, 100s, and Power play",
              value: setting.lmNotification.value,
              onChanged: (val) {
                setting.lmNotification.value = val;
                AppPref().write(AppConfig.lmN, setting.lmNotification.value);
              },
            ),
            ranking(
              context,
              text: "Breaking News",
              subText: "Instant alerts for major cricket news and events",
              value: setting.bnNotification.value,
              onChanged: (val) {
                setting.bnNotification.value = val;
                AppPref().write(AppConfig.bnN, setting.bnNotification.value);
              },
            ),
            ranking(
              context,
              text: "Other",
              subText: "Follow important cricket and player updates",
              value: setting.oNotification.value,
              onChanged: (val) {
                setting.oNotification.value = val;
                AppPref().write(AppConfig.oN, setting.oNotification.value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget ranking(
    BuildContext context, {
    String? text,
    String? subText,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: context.wp(4), right: context.wp(2)),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$text",
                    style: stBarlow(context, fontSize: context.sp(15), fontWeight: FontWeight.w600),
                  ),
                  Text("$subText", style: stBarlow(context, fontSize: context.sp(12))),
                ],
              ),
              const Spacer(),
              Switch(value: value, onChanged: onChanged),
            ],
          ),
          Divider(color: AppColor.tDivider, height: context.hp(3)),
        ],
      ),
    );
  }
}

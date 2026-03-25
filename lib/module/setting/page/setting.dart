import 'package:cricrush/module/setting/ctrl/setting_ctrl.dart';
import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final setting = Get.put(SettingCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: CustomAppBar(
        backgroundColor: AppColor.card,
        toolbarHeight: context.hp(5),
        title: Text(
          "Setting",
          style: tDmSans(context, fontSize: context.sp(17), fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: context.hp(1.5)),
          settingItem(
            onTap: () {
              Navigation.pushNamed(Routes.rankings);
            },
            image: AppAssets.ranking,
            text: "Player Ranking",
            subText: "Track player performance and standings",
          ),
        ],
      ),
    );
  }

  Widget settingItem({GestureTapCallback? onTap, String? image, String? text, String? subText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.wp(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(image ?? "", scale: 20),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$text", style: tDmSans(context)),
                    Text("$subText", style: stBarlow(context, fontSize: context.sp(12))),
                  ],
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios, size: context.sp(18), color: AppColor.subText),
              ],
            ),
            Row(
              children: [
                SizedBox(width: context.wp(10)),
                Expanded(
                  child: Divider(color: AppColor.tDivider, height: context.hp(3)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

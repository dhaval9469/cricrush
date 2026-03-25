import 'package:cricrush/module/setting/ctrl/setting_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BattingMR extends StatefulWidget {
  BattingMR({super.key});

  @override
  State<BattingMR> createState() => _BattingMRState();
}

class _BattingMRState extends State<BattingMR> {
  final setting = Get.find<SettingCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackAppbar: true,
        backgroundColor: AppColor.card,
        toolbarHeight: context.hp(5),
        title: Text(
          "Batting Ranking",
          style: tDmSans(context, fontSize: context.sp(17), fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColor.background,
      body: Column(children: []),
    );
  }
}

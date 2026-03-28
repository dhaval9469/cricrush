import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/module/tours/widget/to_keystate.dart';
import 'package:cricrush/module/tours/widget/to_news.dart';
import 'package:cricrush/module/tours/widget/to_point_table.dart';
import 'package:cricrush/module/tours/widget/to_squad.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TOverview extends StatelessWidget {
  TOverview({super.key});

  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => tourCtrl.csl.value
            ? Center(child: const DL())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    TOKeyState(),
                    TOSquad(),
                    TOPointTable(),
                    TONews(),
                    SizedBox(height: context.hp(3)),
                  ],
                ),
              ),
      ),
    );
  }
}

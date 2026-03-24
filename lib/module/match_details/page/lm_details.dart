import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LmDetails extends StatefulWidget {
  const LmDetails({super.key});

  @override
  State<LmDetails> createState() => _LmDetailsState();
}

class _LmDetailsState extends State<LmDetails> {
  final mdCtrl = Get.find<MatchDetailsCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(children: [

      ]),
    );
  }
}

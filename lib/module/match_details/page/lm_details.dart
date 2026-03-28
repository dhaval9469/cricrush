import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/service/lmw_ser.dart';
import 'package:cricrush/module/match_details/widget/lmd_finish.dart';
import 'package:cricrush/module/match_details/widget/lmd_live.dart';
import 'package:cricrush/module/match_details/widget/lmd_upcoming.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LmDetails extends StatefulWidget {
  const LmDetails({super.key});

  @override
  State<LmDetails> createState() => _LmDetailsState();
}

class _LmDetailsState extends State<LmDetails> {
  final mdCtrl = Get.find<MatchDetailsCtrl>();
  final lmwService = Get.find<LMWService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(() {
        if (lmwService.lmdLoading.value) {
          return Center(child: const DL());
        }

        if (lmwService.wsScoreLMDetailsModel.value == null) {
          return Center(child: ED(text: "No live matches at the moment"));
        }

        final data = lmwService.wsScoreLMDetailsModel.value;
        return data?.status?.toLowerCase() == "match yet to begin"
            ? LmdUpcoming(data: data)
            : data?.status?.toLowerCase() == "match ended"
            ? LmdFinish(data: data)
            : LmdLive(data: data);
      }),
    );
  }
}

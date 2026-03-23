import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/module/tours/widget/tours_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TMatches extends StatelessWidget {
  TMatches({super.key});

  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => tourCtrl.tDL.value
            ? const DL()
            : tourCtrl.tMatchData.value == null
            ? const ED(text: "Matches Not Found")
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: context.hp(1.5)),
                    tourCtrl.tMatchData.value?.live?.isEmpty ?? true
                        ? const SizedBox.shrink()
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: context.hp(1.5), right: context.wp(3), left: context.wp(3)),
                            itemCount: tourCtrl.tMatchData.value?.live?.length ?? 0,
                            itemBuilder: (context, index) {
                              final lmData = tourCtrl.tMatchData.value?.live?[index];
                              return GestureDetector(
                                onTap: () {},
                                child: tLive(context: context, data: lmData),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: context.hp(1.5));
                            },
                          ),

                    tourCtrl.tMatchData.value?.upcoming?.isEmpty ?? true
                        ? const SizedBox.shrink()
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: context.hp(1.5), right: context.wp(3), left: context.wp(3)),
                            itemCount: tourCtrl.tMatchData.value?.upcoming?.length ?? 0,
                            itemBuilder: (context, index) {
                              final umData = tourCtrl.tMatchData.value?.upcoming?[index];
                              return GestureDetector(
                                onTap: () {},
                                child: tUpComing(context: context, data: umData),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: context.hp(1.5));
                            },
                          ),

                    tourCtrl.tMatchData.value?.keyMatches?.isEmpty ?? true
                        ? const SizedBox.shrink()
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: context.hp(1.5), right: context.wp(3), left: context.wp(3)),
                            itemCount: tourCtrl.tMatchData.value?.keyMatches?.length ?? 0,
                            itemBuilder: (context, index) {
                              final kmData = tourCtrl.tMatchData.value?.keyMatches?[index];
                              return GestureDetector(
                                onTap: () {},
                                child: tFinish(context: context, data: kmData),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: context.hp(1.5));
                            },
                          ),

                    tourCtrl.tMatchData.value?.results?.isEmpty ?? true
                        ? const SizedBox.shrink()
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: context.hp(1.5), right: context.wp(3), left: context.wp(3)),
                            itemCount: tourCtrl.tMatchData.value?.results?.length ?? 0,
                            itemBuilder: (context, index) {

                              final fmData = tourCtrl.tMatchData.value?.results?[index];
                              return GestureDetector(
                                onTap: () {},
                                child: tFinish(context: context, data: fmData),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: context.hp(1.5));
                            },
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}

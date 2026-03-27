import 'package:cricrush/module/match_details/ctrl/match_details_ctrl.dart';
import 'package:cricrush/module/match_details/service/lmw_ser.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/module/tours/model/tours_details_model.dart';
import 'package:cricrush/module/tours/widget/tours_widget.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TMatches extends StatelessWidget {
  TMatches({super.key});

  final tourCtrl = Get.find<ToursCtrl>();
  final lmwService = Get.find<LMWService>();
  final mdCtrl = Get.find<MatchDetailsCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => tourCtrl.tDL.value
            ? Center(child: const DL())
            : tourCtrl.tMatchData.value == null
            ? Center(child: const ED(text: "Matches Not Found"))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: context.hp(1.5)),
                    tourCtrl.tMatchData.value?.live?.isEmpty ?? true
                        ? const SizedBox.shrink()
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                              bottom: context.hp(1.5),
                              right: context.wp(3),
                              left: context.wp(3),
                            ),
                            itemCount: tourCtrl.tMatchData.value?.live?.length ?? 0,
                            itemBuilder: (context, index) {
                              final lmData = tourCtrl.tMatchData.value?.live?[index];
                              return GestureDetector(
                                onTap: () {
                                  mdCtrl.seriesId.value = lmData?.matchdetail?.series?.id ?? "";
                                  mdCtrl.tourId.value = lmData?.tourId ?? "";
                                  passLiveData(lmData);
                                  Navigation.pushNamed(Routes.matchDetails);
                                  lmwService.openMatch(lmData?.matchdetail?.match?.code ?? "");
                                },
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
                            padding: EdgeInsets.only(
                              bottom: context.hp(1.5),
                              right: context.wp(3),
                              left: context.wp(3),
                            ),
                            itemCount: tourCtrl.tMatchData.value?.upcoming?.length ?? 0,
                            itemBuilder: (context, index) {
                              final umData = tourCtrl.tMatchData.value?.upcoming?[index];
                              return GestureDetector(
                                onTap: () {
                                  mdCtrl.seriesId.value = umData?.seriesId ?? "";
                                  mdCtrl.tourId.value = umData?.tourId ?? "";
                                  passUpCData(umData);
                                  Navigation.pushNamed(Routes.matchDetails);
                                  lmwService.getLSDFUR(umData?.matchfile ?? "");
                                },
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
                            padding: EdgeInsets.only(
                              bottom: context.hp(1.5),
                              right: context.wp(3),
                              left: context.wp(3),
                            ),
                            itemCount: tourCtrl.tMatchData.value?.keyMatches?.length ?? 0,
                            itemBuilder: (context, index) {
                              final kmData = tourCtrl.tMatchData.value?.keyMatches?[index];
                              return GestureDetector(
                                onTap: () {
                                  mdCtrl.seriesId.value = kmData?.matchdetail?.series?.id ?? "";
                                  mdCtrl.tourId.value = kmData?.tourId ?? "";
                                  passComData(kmData);
                                  Navigation.pushNamed(Routes.matchDetails);
                                  lmwService.openMatch(kmData?.matchdetail?.match?.code ?? "");
                                },
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
                            padding: EdgeInsets.only(
                              bottom: context.hp(1.5),
                              right: context.wp(3),
                              left: context.wp(3),
                            ),
                            itemCount: tourCtrl.tMatchData.value?.results?.length ?? 0,
                            itemBuilder: (context, index) {
                              final fmData = tourCtrl.tMatchData.value?.results?[index];
                              return GestureDetector(
                                onTap: () {
                                  mdCtrl.seriesId.value = fmData?.matchdetail?.series?.id ?? "";
                                  mdCtrl.tourId.value = fmData?.tourId ?? "";
                                  passComData(fmData);
                                  Navigation.pushNamed(Routes.matchDetails);
                                  lmwService.openMatch(fmData?.matchdetail?.match?.code ?? "");
                                },
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

  void passUpCData(TourUpcomingM? data) {
    mdCtrl.matchId.value = data?.matchfile ?? "";
    mdCtrl.matchType.value = data?.matchnumber ?? "";
    mdCtrl.teamAFlag.value = data?.teamaImage ?? "";
    mdCtrl.teamBFlag.value = data?.teambImage ?? "";
    mdCtrl.teamAName.value = data?.teama ?? "";
    mdCtrl.teamBName.value = data?.teamb ?? "";
    mdCtrl.teamASName.value = data?.teamaShort ?? "";
    mdCtrl.teamBSName.value = data?.teambShort ?? "";
  }

  void passComData(TourResultsM? data) {
    mdCtrl.matchId.value = data?.matchdetail?.match?.code ?? "";
    mdCtrl.matchType.value = data?.matchdetail?.match?.number ?? "";
    mdCtrl.teamAFlag.value = data?.teamlist?[0].teamImage ?? "";
    mdCtrl.teamBFlag.value = data?.teamlist?[1].teamImage ?? "";
    mdCtrl.teamAName.value = data?.teamlist?[0].nameFull ?? "";
    mdCtrl.teamBName.value = data?.teamlist?[1].nameFull ?? "";
    mdCtrl.teamASName.value = data?.teamlist?[0].nameShort ?? "";
    mdCtrl.teamBSName.value = data?.teamlist?[1].nameShort ?? "";
  }

  void passLiveData(TourLiveM? data) {
    mdCtrl.matchId.value = data?.matchdetail?.match?.code ?? "";
    mdCtrl.matchType.value = data?.matchdetail?.match?.number ?? "";
    mdCtrl.teamAFlag.value = data?.teamlist?[0].teamImage ?? "";
    mdCtrl.teamBFlag.value = data?.teamlist?[1].teamImage ?? "";
    mdCtrl.teamAName.value = data?.teamlist?[0].nameFull ?? "";
    mdCtrl.teamBName.value = data?.teamlist?[1].nameFull ?? "";
    mdCtrl.teamASName.value = data?.teamlist?[0].nameShort ?? "";
    mdCtrl.teamBSName.value = data?.teamlist?[1].nameShort ?? "";
  }
}

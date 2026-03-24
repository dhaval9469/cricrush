import 'package:cricrush/module/home/model/all_nss_model.dart';
import 'package:cricrush/module/tours/model/tours_details_model.dart';
import 'package:cricrush/module/tours/service/tours_ser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToursCtrl extends GetxController {
  TabController? tabController;

  RxBool tDL = false.obs;
  RxBool allNSSL = true.obs;

  RxString tHeader = "".obs;
  RxString tDes = "".obs;
  RxString tFooter = "".obs;

  RxInt tIndex = 0.obs;

  RxList<NSSNews> newsList = <NSSNews>[].obs;
  RxList<NSSSeries> seriesList = <NSSSeries>[].obs;
  RxList<NSSSort> shortsList = <NSSSort>[].obs;

  Rx<TourMatchList?> tMatchData = Rx<TourMatchList?>(null);
  RxList<TourTeams> tTeamsList = <TourTeams>[].obs;
  RxList<KeyStats> tKeyStatsList = <KeyStats>[].obs;
  RxList<TourPointsTable> tPTList = <TourPointsTable>[].obs;

  RxList<TourSquadPlayers> tBatterList = <TourSquadPlayers>[].obs;
  RxList<TourSquadPlayers> tBowlerList = <TourSquadPlayers>[].obs;
  RxList<TourSquadPlayers> tARList = <TourSquadPlayers>[].obs;
  RxList<TourSquadPlayers> tWkList = <TourSquadPlayers>[].obs;

  Future<void> getAllTD({String? tourId, String? seriesId, bool silentRefresh = false}) async {
    try {
      if (!silentRefresh) {
        tDL.value = true;
        tMatchData.value = null;
        tTeamsList.clear();
        tKeyStatsList.clear();
        tPTList.clear();
      }
      final toursDetailModel = await ToursSer().allTD(tId: tourId, sId: seriesId);
      final bundle = toursDetailModel.iplBundle;
      if (bundle == null) return;

      if (bundle.seriesList != null) {
        tMatchData.value = bundle.seriesList;
      }
      final teams = bundle.iplSquadMeta?.teamsNew;
      if (teams?.isNotEmpty ?? false) {
        tTeamsList.assignAll(teams ?? []);
      }

      final stats = bundle.iplKeyState?.stats;
      if (stats?.isNotEmpty ?? false) {
        tKeyStatsList.assignAll(stats ?? []);
      }

      final points = bundle.iplPointTableMeta?.pointsTable;
      if (points?.isNotEmpty ?? false) {
        tPTList.assignAll(points ?? []);
      }
    } catch (e) {
      debugPrint("❌ Error → $e");
    } finally {
      tDL.value = false;
    }
  }

  Future<void> getAllNSS() async {
    try {
      allNSSL.value = true;
      seriesList.clear();
      newsList.clear();
      shortsList.clear();
      final allNSSModel = await ToursSer().allNSS();
      shortsList.addAll(allNSSModel.newsSortSeri?.sort ?? []);
      newsList.addAll(allNSSModel.newsSortSeri?.news ?? []);
      seriesList.addAll(allNSSModel.newsSortSeri?.series ?? []);
      tHeader.value = seriesList.first.title ?? "";
      tDes.value = seriesList.first.description ?? "";
      tFooter.value = seriesList.first.sortTitle ?? "";
      allNSSL.value = false;
    } catch (e) {
      allNSSL.value = false;
      rethrow;
    }
  }

  @override
  void onInit() {
    getAllNSS();
    getAllTD(tourId: '9935', seriesId: '13180');
    super.onInit();
  }
}

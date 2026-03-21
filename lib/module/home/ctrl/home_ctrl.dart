import 'package:cricrush/module/home/model/all_match_model.dart';
import 'package:cricrush/module/home/model/all_nss_model.dart';
import 'package:cricrush/module/home/service/home_ser.dart';
import 'package:get/get.dart';

class HomeCtrl extends GetxController {
  RxBool allML = true.obs;
  RxBool allNSSL = true.obs;

  RxInt hmcIndex = 0.obs;

  RxList<LiveSeriesData> liveSeriesData = <LiveSeriesData>[].obs;
  RxList<UCSeriesData> upSeriesData = <UCSeriesData>[].obs;
  RxList<RSeriesData> rSeriesData = <RSeriesData>[].obs;
  RxList<HAllMatches> recentMatches = <HAllMatches>[].obs;

  RxList<NSSNews> newsList = <NSSNews>[].obs;
  RxList<NSSSeries> seriesList = <NSSSeries>[].obs;
  RxList<NSSSort> shortsList = <NSSSort>[].obs;

  Future<void> getAllMatch({bool silentRefresh = false}) async {
    try {
      if (!silentRefresh) {
        allML.value = true;
        liveSeriesData.clear();
        upSeriesData.clear();
        rSeriesData.clear();
        recentMatches.clear();
      }
      final allMatchModel = await HomeSer().allMatch();
      liveSeriesData.assignAll(allMatchModel.mtlive!.seriesData!);
      if (allMatchModel.mtupcoming?.seriesData?.isNotEmpty ?? false) {
        upSeriesData.assignAll(allMatchModel.mtupcoming!.seriesData!);
      }
      if (allMatchModel.mtresult?.seriesData?.isNotEmpty ?? false) {
        rSeriesData.assignAll(allMatchModel.mtresult!.seriesData!);
      }
      if (allMatchModel.home?.matches?.isNotEmpty ?? false) {
        recentMatches.assignAll(allMatchModel.home!.matches!);
      }
    } catch (e) {
      allML.value = false;
      rethrow;
    } finally {
      allML.value = false;
    }
  }

  Future<void> getAllNSS() async {
    try {
      allNSSL.value = true;
      seriesList.clear();
      newsList.clear();
      shortsList.clear();
      final allNSSModel = await HomeSer().allNSS();
      shortsList.addAll(allNSSModel.newsSortSeri?.sort ?? []);
      newsList.addAll(allNSSModel.newsSortSeri?.news ?? []);
      seriesList.addAll(allNSSModel.newsSortSeri?.series ?? []);
      allNSSL.value = false;
    } catch (e) {
      allNSSL.value = false;
      rethrow;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllMatch();
    getAllNSS();
  }
}

import 'package:cricrush/module/home/model/all_match_model.dart';
import 'package:cricrush/module/home/service/home_ser.dart';
import 'package:get/get.dart';

class HomeCtrl extends GetxController {
  RxBool allML = true.obs;

  RxInt hmcIndex = 0.obs;

  RxList<LiveSeriesData> liveSeriesData = <LiveSeriesData>[].obs;
  RxList<UCSeriesData> upSeriesData = <UCSeriesData>[].obs;
  RxList<RSeriesData> rSeriesData = <RSeriesData>[].obs;
  RxList<HAllMatches> recentMatches = <HAllMatches>[].obs;

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

  @override
  void onInit() {
    super.onInit();
    getAllMatch();
  }
}

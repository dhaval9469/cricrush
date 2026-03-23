import 'package:cricrush/module/home/model/all_match_model.dart';
import 'package:cricrush/module/home/model/all_nss_model.dart';
import 'package:cricrush/module/home/service/home_ser.dart';
import 'package:cricrush/module/schedule/model/match_type.dart';
import 'package:get/get.dart';

class HomeCtrl extends GetxController {
  RxBool allML = true.obs;

  RxInt hmcIndex = 0.obs;

  RxString lsMatchTypes = "All".obs;
  RxString usMatchTypes = "All".obs;
  RxString rsMatchTypes = "All".obs;

  RxList<LiveSeriesData> allLSData = <LiveSeriesData>[].obs;
  RxList<UCSeriesData> allUSData = <UCSeriesData>[].obs;
  RxList<RSeriesData> allRSData = <RSeriesData>[].obs;

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
        allLSData.clear();
        allUSData.clear();
        allRSData.clear();
      }
      final allMatchModel = await HomeSer().allMatch();
      if (allMatchModel.mtlive?.seriesData?.isNotEmpty ?? false) {
        liveSeriesData.assignAll(allMatchModel.mtlive!.seriesData!);
        allLSData.assignAll(allMatchModel.mtlive!.seriesData!);
      }
      if (allMatchModel.mtupcoming?.seriesData?.isNotEmpty ?? false) {
        upSeriesData.assignAll(allMatchModel.mtupcoming!.seriesData!);
        allUSData.assignAll(allMatchModel.mtupcoming!.seriesData!);
      }
      if (allMatchModel.mtresult?.seriesData?.isNotEmpty ?? false) {
        rSeriesData.assignAll(allMatchModel.mtresult!.seriesData!);
        allRSData.assignAll(allMatchModel.mtresult!.seriesData!);
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

  List<MatchType> matchTypes = [
    MatchType(mt: "All", mtList: ['all']),
    MatchType(mt: "T20", mtList: ['t20', 't20i']),
    MatchType(mt: "ODI", mtList: ['odi']),
    MatchType(mt: "Test", mtList: ['test']),
  ];

  @override
  void onInit() {
    super.onInit();
    getAllMatch();
  }
}

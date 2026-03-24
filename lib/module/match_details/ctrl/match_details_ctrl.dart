import 'package:cricrush/module/match_details/model/commentary_model.dart';
import 'package:cricrush/module/match_details/model/overs_model.dart';
import 'package:cricrush/module/match_details/service/match_details_Ser.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class MatchDetailsCtrl extends GetxController {
  RxString matchId = "".obs;
  RxString seriesId = "".obs;
  RxString matchType = "".obs;
  RxString teamAFlag = "".obs;
  RxString teamBFlag = "".obs;
  RxString teamASName = "".obs;
  RxString teamBSName = "".obs;
  RxString teamAName = "".obs;
  RxString teamBName = "".obs;
  RxString chartBatingTeam = "".obs;
  RxString seriesName = "".obs;
  RxString matchStatus = "".obs;

  RxInt innIgs = 0.obs;

  RxBool commentaryLoading = false.obs;
  RxBool overLoading = false.obs;

  final RefreshController refreshSBCtrl = RefreshController(initialRefresh: false);
  final RefreshController refreshCommCtrl = RefreshController(initialRefresh: false);
  final RefreshController refreshOverCtrl = RefreshController(initialRefresh: false);

  Rx<CommentaryData?> commentaryData = Rx(null);
  Rx<OversData?> overData = Rx(null);
  RxList<OBOInings> wormList = <OBOInings>[].obs;
  RxList<OBOInings> rpoList = <OBOInings>[].obs;

  Future<void> getCommentary(String matchId, {bool silentRefresh = false}) async {
    try {
      if (!silentRefresh) {
        commentaryLoading.value = true;
        commentaryData.value = null;
      }
      final data = await MatchDetailsSer().commentary(mId: matchId);
      if (data.commentry != null) {
        commentaryData.value = data.commentry;
        innIgs.value = data.commentry?.currentIng ?? 0;
      } else {
        commentaryData.value = null;
      }
    } catch (e) {
      commentaryData.value = null;
      rethrow;
    } finally {
      if (!silentRefresh) {
        commentaryLoading.value = false;
      }
    }
  }

  Future<void> getCommentaryByInning(String matchId) async {
    try {
      int ing = innIgs.value - 1;
      if (ing <= 0) {
        refreshCommCtrl.loadNoData();
        return;
      }

      final data = await MatchDetailsSer().commentaryByInning(mId: matchId, ining: ing);

      final newItems = data.commentry?.commentary ?? [];
      if (commentaryData.value?.commentary == null || commentaryData.value!.commentary!.isEmpty) {
        commentaryData.value = data.commentry;
      } else {
        commentaryData.value?.commentary = [...commentaryData.value!.commentary!, ...newItems];
      }
      commentaryData.refresh();

      innIgs.value = data.commentry?.currentIng ?? 0;

      if (newItems.isEmpty) {
        refreshCommCtrl.loadNoData();
      } else {
        refreshCommCtrl.loadComplete();
      }
    } catch (e) {
      refreshCommCtrl.loadFailed();
      rethrow;
    }
  }

  Future<void> getOver(String matchId, {bool silentRefresh = false}) async {
    try {
      if (!silentRefresh) {
        overLoading.value = true;
        overData.value = null;
        wormList.clear();
        rpoList.clear();
      }
      final data = await MatchDetailsSer().over(mId: matchId);
      if (data.over != null) {
        overData.value = data.over;
        wormList.addAll(data.over?.ing ?? []);
        rpoList.addAll(data.over?.ing ?? []);
        chartBatingTeam.value = (data.over?.ing?.isNotEmpty ?? false) ? data.over!.ing?.first.battingteam ?? "" : "";
      } else {
        overData.value = null;
      }
    } catch (e) {
      overData.value = null;
      rethrow;
    } finally {
      if (!silentRefresh) {
        overLoading.value = false;
      }
    }
  }
}

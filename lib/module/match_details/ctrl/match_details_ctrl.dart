import 'package:cricrush/module/match_details/model/commentary_model.dart';
import 'package:cricrush/module/match_details/model/overs_model.dart';
import 'package:cricrush/module/match_details/model/scoreboard_model.dart';
import 'package:cricrush/module/match_details/model/squad_model.dart';
import 'package:cricrush/module/match_details/model/point_table_model.dart';
import 'package:cricrush/module/match_details/service/match_details_ser.dart';
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
  RxInt isSquad = 0.obs;
  RxInt over = 0.obs;
  RxInt speakText = 0.obs;

  RxBool commentaryLoading = false.obs;
  RxBool overLoading = false.obs;
  RxBool squadLoading = false.obs;
  RxBool pointTableLoader = false.obs;
  RxBool scoreboardLoading = false.obs;

  final RefreshController refreshSBCtrl = RefreshController(initialRefresh: false);
  final RefreshController refreshCommCtrl = RefreshController(initialRefresh: false);
  final RefreshController refreshOverCtrl = RefreshController(initialRefresh: false);

  Rx<ScoreboardData?> scoreboardData = Rx(null);
  Rx<CommentaryData?> commentaryData = Rx(null);
  Rx<OversData?> overData = Rx(null);
  Rx<SquadData?> squadData = Rx(null);
  RxList<PointsTable> pointsTableList = <PointsTable>[].obs;

  RxList<OBOInings> wormList = <OBOInings>[].obs;
  RxList<OBOInings> rpoList = <OBOInings>[].obs;

  Future<void> getScoreBoard(String matchId, {bool silentRefresh = false}) async {
    try {
      if (!silentRefresh) {
        scoreboardLoading.value = true;
        scoreboardData.value = null;
      }
      final data = await MatchDetailsSer().scoreboard(mId: matchId);
      if (data.scoreboard != null) {
        scoreboardData.value = data.scoreboard;
      } else {
        scoreboardData.value = null;
      }
    } catch (e) {
      scoreboardData.value = null;
      rethrow;
    } finally {
      if (!silentRefresh) {
        scoreboardLoading.value = false;
      }
    }
  }

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
        chartBatingTeam.value = (data.over?.ing?.isNotEmpty ?? false)
            ? data.over!.ing?.first.battingteam ?? ""
            : "";
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

  Future<void> getSquad(String matchId) async {
    try {
      squadLoading.value = true;
      squadData.value = null;
      final data = await MatchDetailsSer().squad(mId: matchId);
      if (data.squad != null) {
        squadData.value = data.squad;
      } else {
        squadData.value = null;
      }
    } catch (e) {
      squadData.value = null;
      rethrow;
    } finally {
      squadLoading.value = false;
    }
  }

  Future<void> getPointTable(String id) async {
    try {
      pointTableLoader.value = true;
      pointsTableList.clear();
      final data = await MatchDetailsSer().pointTable(mId: id);
      final newPointsTable = data.iplPointTableMeta?.pointsTable;
      if (newPointsTable != null && newPointsTable.isNotEmpty) {
        pointsTableList.addAll(newPointsTable);
      }
    } catch (e) {
      pointsTableList.clear();
      rethrow;
    } finally {
      pointTableLoader.value = false;
    }
  }
}

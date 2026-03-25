import 'package:cricrush/helper/network_helper.dart';
import 'package:cricrush/module/match_details/model/commentary_model.dart';
import 'package:cricrush/module/match_details/model/lmw_model.dart';
import 'package:cricrush/module/match_details/model/overs_model.dart';
import 'package:cricrush/module/match_details/model/scoreboard_model.dart';
import 'package:cricrush/module/match_details/model/squad_model.dart';
import 'package:cricrush/module/match_details/model/point_table_model.dart';
import 'package:cricrush/res/app_config.dart';

class MatchDetailsSer {
  NetworkAPICall networkAPICall = NetworkAPICall();

  Future<ScoreBoardModel> scoreboard({String? mId}) async {
    try {
      final response = await networkAPICall.get('${AppConfig.pyScoreboard}$mId');
      return ScoreBoardModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<LMWModel> lmDetails({String? matchId}) async {
    try {
      final response = await networkAPICall.get('${AppConfig.pyLive}$matchId');
      return LMWModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<CommentaryModel> commentary({String? mId}) async {
    try {
      final response = await networkAPICall.get('${AppConfig.pyCommentary}$mId');
      return CommentaryModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<CommentaryModel> commentaryByInning({String? mId, int? ining}) async {
    try {
      final response = await networkAPICall.get(
        '${AppConfig.pyCommentary}$mId/${ining.toString()}',
      );

      return CommentaryModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<OversModel> over({String? mId}) async {
    try {
      final response = await networkAPICall.get('${AppConfig.pyOver}$mId');
      return OversModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<SquadModel> squad({String? mId}) async {
    try {
      final response = await networkAPICall.get('${AppConfig.pySquad}$mId');
      return SquadModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PointTableModel> pointTable({String? mId}) async {
    try {
      final response = await networkAPICall.get('${AppConfig.pyPointTable}$mId');
      return PointTableModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}

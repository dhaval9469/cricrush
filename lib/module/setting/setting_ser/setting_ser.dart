import 'package:cricrush/helper/network_helper.dart';
import 'package:cricrush/module/setting/model/ranking_model.dart';
import 'package:cricrush/res/app_config.dart';

class SettingSer {
  NetworkAPICall networkAPICall = NetworkAPICall();

  Future<AllRankingModel> allRanking() async {
    try {
      final response = await networkAPICall.get(AppConfig.pyAllRanking);
      return AllRankingModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

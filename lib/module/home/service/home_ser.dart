import 'package:cricrush/helper/network_helper.dart';
import 'package:cricrush/module/home/model/all_match_model.dart';
import 'package:cricrush/res/app_config.dart';

class HomeSer {
  NetworkAPICall networkAPICall = NetworkAPICall();

  Future<AllMatchModel> allMatch() async {
    try {
      final response = await networkAPICall.get(AppConfig.wsAllNew);
      return AllMatchModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

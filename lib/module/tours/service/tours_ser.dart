import 'package:cricrush/helper/network_helper.dart';
import 'package:cricrush/module/home/model/all_nss_model.dart';
import 'package:cricrush/module/tours/model/tours_details_model.dart';
import 'package:cricrush/res/app_config.dart';

class ToursSer {
  NetworkAPICall networkAPICall = NetworkAPICall();

  Future<ToursDetailModel> allTD({String? tId, String? sId}) async {
    try {
      final response = await networkAPICall.get('${AppConfig.endPoint?.pyIpl}$tId/$sId');
      return ToursDetailModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<AllNSSModel> allNSS() async {
    try {
      final response = await networkAPICall.get("${AppConfig.endPoint?.pyNewsSortSeri}");
      return AllNSSModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:cricrush/helper/local_storage_service.dart';
import 'package:cricrush/module/setting/model/ranking_model.dart';
import 'package:cricrush/module/setting/setting_ser/setting_ser.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:get/get.dart';

class SettingCtrl extends GetxController {
  RxBool isAllRanking = false.obs;
  RxBool allNotification = true.obs;
  RxBool lmaNotification = true.obs;
  RxBool lmNotification = true.obs;
  RxBool bnNotification = true.obs;
  RxBool oNotification = true.obs;

  RxInt battingMRF = 1.obs;
  RxInt battingWRF = 1.obs;

  Rx<AllRanking?> allRankingModel = Rx<AllRanking?>(null);
  RxList<WomenRanking> woManTeamRankingList = <WomenRanking>[].obs;
  RxList<TeamRanking> iccMenTeamRList = <TeamRanking>[].obs;
  RxList<Batters> iccMenBatsmenRList = <Batters>[].obs;
  RxList<Batters> iccMenBowlerRList = <Batters>[].obs;
  RxList<Batters> iccMenAllRounderRList = <Batters>[].obs;
  RxList<TeamRanking> iccWomMenTeamRList = <TeamRanking>[].obs;
  RxList<Batters> iccWomenBatsmenRList = <Batters>[].obs;
  RxList<Batters> iccWomenBowlerRList = <Batters>[].obs;
  RxList<Batters> iccWomenAllRounderRList = <Batters>[].obs;

  Future<void> getAllRanking() async {
    try {
      isAllRanking.value = true;
      allRankingModel.value = null;
      iccMenTeamRList.clear();
      iccWomMenTeamRList.clear();
      iccMenBatsmenRList.clear();
      iccWomenBatsmenRList.clear();
      iccMenBowlerRList.clear();
      iccWomenBowlerRList.clear();
      iccMenAllRounderRList.clear();
      iccWomenAllRounderRList.clear();

      final data = await SettingSer().allRanking();
      allRankingModel.value = data.allRanking;
      iccMenBatsmenRList.addAll(data.allRanking?.men?[1].t20?.bat ?? []);
      iccMenBowlerRList.addAll(data.allRanking?.men?[1].t20?.bowl ?? []);
      iccMenAllRounderRList.addAll(data.allRanking?.men?[1].t20?.allrounder ?? []);
      iccWomenBatsmenRList.addAll(data.allRanking?.women?[1].t20w?.bat ?? []);
      iccWomenBowlerRList.addAll(data.allRanking?.women?[1].t20w?.bowl ?? []);
      iccWomenAllRounderRList.addAll(data.allRanking?.women?[1].t20w?.allrounder ?? []);
      iccMenTeamRList.addAll(data.allRanking?.men?[1].t20?.teamRanking ?? []);
      iccWomMenTeamRList.addAll(data.allRanking?.women?[1].t20w?.teamRanking ?? []);
    } catch (_) {
    } finally {
      isAllRanking.value = false;
    }
  }

  @override
  void onInit() {
    notificationStaus();
    super.onInit();
  }

  void notificationStaus() {
    allNotification.value = AppPref().read(AppConfig.allN) ?? true;
    lmaNotification.value = AppPref().read(AppConfig.lmaN) ?? true;
    lmNotification.value = AppPref().read(AppConfig.lmN) ?? true;
    bnNotification.value = AppPref().read(AppConfig.bnN) ?? true;
    oNotification.value = AppPref().read(AppConfig.oN) ?? true;
  }
}

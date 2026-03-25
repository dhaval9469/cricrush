import 'package:cricrush/module/setting/model/ranking_model.dart';
import 'package:cricrush/module/setting/setting_ser/setting_ser.dart';
import 'package:get/get.dart';

class SettingCtrl extends GetxController {
  RxBool isAllRanking = false.obs;

  RxInt chooseManFormat = 1.obs;
  RxInt chooseWoManFormat = 1.obs;
  RxInt imageIndex = 1.obs;
  RxInt planIndex = 1.obs;
  RxString selectPlan = "".obs;
  RxString transactionDate = "".obs;

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
      iccMenBatsmenRList.addAll(data.allRanking?.men?[0].odi?.bat ?? []);
      iccMenBowlerRList.addAll(data.allRanking?.men?[0].odi?.bowl ?? []);
      iccMenAllRounderRList.addAll(data.allRanking?.men?[0].odi?.allrounder ?? []);
      iccWomenBatsmenRList.addAll(data.allRanking?.women?[0].odiw?.bat ?? []);
      iccWomenBowlerRList.addAll(data.allRanking?.women?[0].odiw?.bowl ?? []);
      iccWomenAllRounderRList.addAll(data.allRanking?.women?[0].odiw?.allrounder ?? []);
      iccMenTeamRList.addAll(data.allRanking?.men?[0].odi?.teamRanking ?? []);
      iccWomMenTeamRList.addAll(data.allRanking?.women?[0].odiw?.teamRanking ?? []);
    } catch (_) {
    } finally {
      isAllRanking.value = false;
    }
  }
}

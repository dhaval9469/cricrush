import 'package:cricrush/module/home/model/all_nss_model.dart';
import 'package:get/get.dart';

class SortsCtrl extends GetxController {
  RxInt sortIndex = 0.obs;
  RxInt scIndex = 0.obs;

  RxList<NSSSort> shortsList = <NSSSort>[].obs;
}


import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/res/app_config.dart';

class OverAdManager {
  static bool _isShowing = false;
  static int _lastShownOver = -1;

  static bool canShow(int currentOver) {
    if (_isShowing) return false;
    if (currentOver == _lastShownOver) return false;
    if (currentOver <= 0) return false;
    if (currentOver % (AppConfig.unitIdModel?.adOver ?? 1) != 0) return false;
    return true;
  }

  static void show({required int currentOver}) {
    _isShowing = true;
    _lastShownOver = currentOver;

    Interstitial.showOverInterstitialAds(
      onAdClosed: () {
        _isShowing = false;
      },
    );
  }

  static void reset() {
    _isShowing = false;
    _lastShownOver = -1;
  }
}

class StatusAdManager {
  static bool _isStatusShowing = false;
  static String _lastAdStatus = "";

  static bool canShowForStatus(String status) {
    if (_isStatusShowing) return false;
    if (_lastAdStatus == status) return false;
    return true;
  }

  static void showStatusAd(String status) {
    _isStatusShowing = true;
    _lastAdStatus = status;

    Interstitial.showOverInterstitialAds(
      onAdClosed: () {
        _isStatusShowing = false;
      },
    );
  }

  static void reset() {
    _isStatusShowing = false;
    _lastAdStatus = "";
  }
}

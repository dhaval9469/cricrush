import 'package:cricrush/res/app_config.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppOpenAdManager {
  AppOpenAd? _appOpenAd;
  static bool isShowingAd = false;

  Future<void> loadAd() async {
    await AppOpenAd.load(
      adUnitId: "${AppConfig.unitIdModel?.appOpen}",
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  Future<void> loadSplashAds({required String id}) async {
    return AppOpenAd.load(
      adUnitId: id,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          _appOpenAd!.show();
        },
        onAdFailedToLoad: (error) {
          // Handle the error.
        },
      ),
    );
  }

  void showAdIfAvailable() {
    if (!isAdAvailable) {
      loadAd();
      return;
    } else {
      _appOpenAd!.show();
    }
    if (isShowingAd) {
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        isShowingAd = true;
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        loadAd();
      },
    );
  }

  bool get isAdAvailable {
    return _appOpenAd != null;
  }
}

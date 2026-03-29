import 'package:cricrush/res/app_config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const int maxFailedLoadAttempts = 3;

class Interstitial {
  static InterstitialAd? adMobInterstitialAd;

  static int _numInterstitialLoadAttempts = 0;
  static int interstitialAdShow = 0;
  static int interstitialBackAdShow = 0;

  static void loadInterstitialAds() async {
    InterstitialAd.load(
      adUnitId: "${AppConfig.unitIdModel?.interstitial}",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          adMobInterstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _numInterstitialLoadAttempts++;
          adMobInterstitialAd = null;
          if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
            loadInterstitialAds();
          }
        },
      ),
    );
  }

  static void showInterstitialAds() {
    if (adMobInterstitialAd != null) {
      adMobInterstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          loadInterstitialAds();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          loadInterstitialAds();
        },
      );
      adMobInterstitialAd?.show();
      adMobInterstitialAd = null;
    } else {
      loadInterstitialAds();
    }
  }

  static void showInterstitialByCount() {
    interstitialAdShow++;
    if (interstitialAdShow == AppConfig.unitIdModel?.interstitialCount) {
      interstitialAdShow = 0;
      showInterstitialAds();
    }
  }

  static void showInterstitialByBackCount() {
    interstitialBackAdShow++;
    if (interstitialBackAdShow == AppConfig.unitIdModel?.interstitialBackCount) {
      interstitialBackAdShow = 0;
      showInterstitialAds();
    }
  }

  static void showOverInterstitialAds({VoidCallback? onAdClosed}) {
    if (adMobInterstitialAd != null) {
      adMobInterstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          loadInterstitialAds();
          onAdClosed?.call();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          loadInterstitialAds();
          onAdClosed?.call();
        },
      );
      adMobInterstitialAd?.show();
      adMobInterstitialAd = null;
    } else {
      loadInterstitialAds();
      onAdClosed?.call();
    }
  }
}

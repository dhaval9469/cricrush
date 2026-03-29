import 'dart:async';

import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/helper/connection_service.dart';
import 'package:cricrush/helper/local_storage_service.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/no_internet_popup.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  InterstitialAd? adMobInterstitialAd;
  int numInterstitialLoadAttempts = 0;

  BannerAd? bannerAd;
  double progress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    connection();
    loadBannerAd();
    loadInterstitialAds();
    startLoading();
  }

  void startLoading() {
    _timer?.cancel();
    progress = 0;

    bool intro = AppPref().read(AppConfig.intro) ?? false;

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!mounted) return;

      setState(() {
        progress += 0.01;
      });

      if (progress >= 1) {
        timer.cancel();
        navigateNext(intro);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(backgroundColor: AppColor.background, toolbarHeight: 0),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "LIVESCORE\nCRICKET",
                textAlign: TextAlign.center,
                style: GoogleFonts.rajdhani(
                  color: AppColor.text,
                  fontWeight: FontWeight.bold,
                  fontSize: context.sp(30),
                  fontStyle: FontStyle.italic,
                  height: 1.2,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(10)),
            child: GlowProgressBar(progress: progress),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wp(10), vertical: context.hp(1.5)),
            child: Text(
              "${(progress * 100).toInt()} %",
              style: tDmSans(context, fontWeight: FontWeight.bold, fontSize: context.sp(25)).copyWith(
                shadows: [Shadow(color: Colors.black87, blurRadius: 10, offset: Offset(0, 3))],
              ),
            ),
          ),

          Text("This action may include advertisements.", style: stDmSans(context)),
          SizedBox(height: context.hp(1.5)),
          Center(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOutCubic,
              child: bannerAd != null
                  ? SizedBox(
                      width: bannerAd?.size.width.toDouble(),
                      height: bannerAd?.size.height.toDouble(),
                      child: AdWidget(ad: bannerAd!),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          SizedBox(height: context.hp(8)),
        ],
      ),
    );
  }

  void navigateNext(bool intro) {
    if (adMobInterstitialAd != null) {
      adMobInterstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          goNext(intro);
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          goNext(intro);
        },
      );
      adMobInterstitialAd!.show();
      adMobInterstitialAd = null;
    } else {
      goNext(intro);
    }
    goNext(intro);
  }

  void goNext(bool intro) {
    if (!mounted) return;
    if (intro) {
      Navigation.pushNamed(Routes.bottomPage);
    } else {
      Navigation.pushNamed(Routes.getStarted);
    }
    Interstitial.loadInterstitialAds();
  }

  void loadBannerAd() async {
    final ad = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      request: const AdRequest(),
      size: AdSize.largeBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    await ad.load();
  }

  void loadInterstitialAds() async {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          adMobInterstitialAd = ad;
          numInterstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          numInterstitialLoadAttempts++;
          adMobInterstitialAd = null;
          if (numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
            loadInterstitialAds();
          }
        },
      ),
    );
  }

  Future<void> connection() async {
    final hasConnection = await ConnectionService.instance.checkConnection();

    if (!mounted) return;

    if (!hasConnection) {
      NoInternetPopup.show(
        context,
        onTryAgain: () {
          loadBannerAd();
          loadInterstitialAds();
          startLoading();
          connection();
        },
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

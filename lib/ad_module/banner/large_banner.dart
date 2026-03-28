import 'package:cricrush/res/app_config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class LargeBannerAd extends StatefulWidget {
  final EdgeInsetsGeometry? padding;

  const LargeBannerAd({super.key, this.padding});

  @override
  State<LargeBannerAd> createState() => _LargeBannerAdState();
}

class _LargeBannerAdState extends State<LargeBannerAd> {
  BannerAd? bannerAd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadAd();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
      child: bannerAd != null
          ? Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: SizedBox(
                width: bannerAd?.size.width.toDouble(),
                height: bannerAd?.size.height.toDouble(),
                child: AdWidget(ad: bannerAd!),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Future<void> loadAd() async {
    final ad = BannerAd(
      adUnitId: "${AppConfig.unitIdModel?.banner}",
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
}

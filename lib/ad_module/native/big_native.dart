import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

class FullNativeBAd extends StatefulWidget {
  final bool isCall;

  const FullNativeBAd({super.key, this.isCall = false});

  @override
  State<FullNativeBAd> createState() => _FullNativeBAdState();
}

class _FullNativeBAdState extends State<FullNativeBAd> {
  NativeAd? nativeAd;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: isLoading
          ? NativeBigShimmer(isCall: widget.isCall)
          : nativeAd != null
          ? ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 450,
                minHeight: 277,
                maxHeight: 277,
                maxWidth: 450,
              ),
              key: const ValueKey('bigAad'),
              child: Center(child: AdWidget(ad: nativeAd!)),
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }

  void load() {
    NativeAd(
      adUnitId: "${AppConfig.unitIdModel?.native}",
      factoryId: 'big_native',
      customOptions: {
        'backgroundColor': "#2A2E3A",
        'textColor': '#FFFFFF',
        'subTextColor': '#CDD3E0',
        'buttonColor': '#016BFD',
        'startColor': '#FF6B4A',
      },
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isLoading = false;
          nativeAd = ad as NativeAd?;
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          isLoading = false;
          ad.dispose();
          setState(() {});
        },
      ),
    ).load();
  }
}

class NativeBigShimmer extends StatelessWidget {
  final bool isCall;

  const NativeBigShimmer({super.key, required this.isCall});

  @override
  Widget build(BuildContext context) {
    final baseColor = AppColor.shimmerBase;
    final highlightColor = AppColor.shimmerHighlight;
    return Container(
      height: 277,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColor.shimmerPlaceholder,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColor.shimmerPlaceholder,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 16, width: isCall == true ? 180 : 200, color: AppColor.shimmerPlaceholder),
                      const SizedBox(height: 6),
                      Container(height: 20, width: isCall == true ? 180 : 200, color: AppColor.shimmerPlaceholder),
                    ],
                  ),
                ),
              ],
            ),
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 33,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.shimmerPlaceholder,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

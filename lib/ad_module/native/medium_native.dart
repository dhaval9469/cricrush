import 'package:cricrush/res/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

import '../../res/app_config.dart';

class MediumNativeBAd extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final bool? isShadow;

  const MediumNativeBAd({super.key, this.padding, this.radius, this.isShadow = false});

  @override
  State<MediumNativeBAd> createState() => _MediumNativeBAdState();
}

class _MediumNativeBAdState extends State<MediumNativeBAd> {
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
          ? Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius ?? 0),
                child: NativeBigShimmer(),
              ),
            )
          : nativeAd != null
          ? Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius ?? 0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 450,
                    minHeight: 180,
                    maxHeight: 180,
                    maxWidth: 450,
                  ),
                  key: const ValueKey('mediumAad'),
                  child: Center(child: AdWidget(ad: nativeAd!)),
                ),
              ),
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
      factoryId: 'medium_native',
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
  const NativeBigShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = AppColor.shimmerBase;
    final highlightColor = AppColor.shimmerHighlight;
    return Container(
      height: 180,
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
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    width: 135,
                    height: 125,
                    decoration: BoxDecoration(
                      color: AppColor.shimmerPlaceholder,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                        const SizedBox(width: 7),
                        Shimmer.fromColors(
                          baseColor: baseColor,
                          highlightColor: highlightColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(height: 16, width: 130, color: AppColor.shimmerPlaceholder),
                              const SizedBox(height: 6),
                              Container(height: 20, width: 130, color: AppColor.shimmerPlaceholder),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Shimmer.fromColors(
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                      child: Container(
                        width: 185,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColor.shimmerPlaceholder,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
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

// ---------------------------------  animation ad -------------------------------------------------

class MediumNativeB extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const MediumNativeB({super.key, this.padding, this.radius});

  @override
  State<MediumNativeB> createState() => _MediumNativeBState();
}

class _MediumNativeBState extends State<MediumNativeB> {
  NativeAd? nativeAd;
  bool isLoading = true;
  bool? isDark;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double targetHeight = (isLoading || nativeAd == null) ? 0 : 180;
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: SizedBox(
          height: targetHeight,
          width: double.infinity,
          child: nativeAd != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(widget.radius ?? 0),
                  child: OverflowBox(
                    minHeight: 180,
                    maxHeight: 180,
                    alignment: Alignment.topCenter,
                    child: AdWidget(ad: nativeAd!),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
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
      factoryId: 'medium_native',
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

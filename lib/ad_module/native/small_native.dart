import 'package:cricrush/res/app_config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

class SmallNative extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const SmallNative({super.key, this.padding, this.radius});

  @override
  State<SmallNative> createState() => _SmallNativeState();
}

class _SmallNativeState extends State<SmallNative> {
  NativeAd? nativeAd;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: isLoading
          ? Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: ClipRRect(borderRadius: BorderRadius.circular(widget.radius ?? 0), child: NativeAdShimmer()),
            )
          : nativeAd != null
          ? Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius ?? 0),
                child: SizedBox(
                  key: const ValueKey('ad'),
                  height: 110,
                  width: double.infinity,
                  child: AdWidget(ad: nativeAd!),
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
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isLoading = false;
          nativeAd = ad as NativeAd?;
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          isLoading = false;
          setState(() {});
          ad.dispose();
        },
      ),
      factoryId: 'small_native',
      customOptions: {
        'backgroundColor': "#2A2E3A",
        'textColor': '#FFFFFF',
        'subTextColor': '#CDD3E0',
        'buttonColor': '#016BFD',
        'startColor': '#FF6B4A',
      },
    ).load();
  }
}

class NativeAdShimmer extends StatelessWidget {
  const NativeAdShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final baseColor = isDark ? Colors.white.withValues(alpha: 0.1) : Colors.grey.shade300;
    final highlightColor = isDark ? Colors.white.withValues(alpha: 0.2) : Colors.grey.shade100;
    return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(width: 10),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 16, width: 200, color: Colors.grey),
                      const SizedBox(height: 6),
                      Container(height: 20, width: 200, color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------  animation ad -------------------------------------------------

class SmallNativeB extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const SmallNativeB({super.key, this.padding, this.radius});

  @override
  State<SmallNativeB> createState() => _SmallNativeBState();
}

class _SmallNativeBState extends State<SmallNativeB> {
  NativeAd? nativeAd;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    load();
  }

  @override
  Widget build(BuildContext context) {
    final double targetHeight = (isLoading || nativeAd == null) ? 0 : 110;
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
                    minHeight: 110,
                    maxHeight: 110,
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
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isLoading = false;
          nativeAd = ad as NativeAd?;
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          isLoading = false;
          setState(() {});
          ad.dispose();
        },
      ),
      factoryId: 'small_native',
      customOptions: {
        'backgroundColor': "#2A2E3A",
        'textColor': '#FFFFFF',
        'subTextColor': '#CDD3E0',
        'buttonColor': '#016BFD',
        'startColor': '#FF6B4A',
      },
    ).load();
  }
}

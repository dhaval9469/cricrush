import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

class NativeBanner extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const NativeBanner({super.key, this.padding, this.radius});

  @override
  State<NativeBanner> createState() => _NativeBannerState();
}

class _NativeBannerState extends State<NativeBanner> {
  NativeAd? _nativeAd;
  bool isLoading = true;
  bool? isDark;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAd();
    });
  }

  Future<void> loadAd() async {
    NativeAd(
      adUnitId: "${AppConfig.unitIdModel?.native}",
      factoryId: 'native_banner',
      customOptions: {
        'backgroundColor': "#2A2E3A",
        'textColor': '#FFFFFF',
        'subTextColor': '#CDD3E0',
        'buttonColor': '#016BFD',
        'startColor': '#FF6B4A',
      },
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isLoading = false;
          _nativeAd = ad as NativeAd?;
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          isLoading = false;
          ad.dispose();
          setState(() {});
        },
      ),
      request: const AdRequest(),
    ).load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: isLoading
          ? Padding(padding: widget.padding ?? EdgeInsets.zero, child: NativeBannerShimmer())
          : _nativeAd != null
          ? Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius ?? 0),
                child: SizedBox(
                  key: const ValueKey('nbAd'),
                  height: 65,
                  width: double.infinity,
                  child: AdWidget(ad: _nativeAd!),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

class NativeBannerShimmer extends StatelessWidget {
  final double? radius;

  const NativeBannerShimmer({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    final baseColor = AppColor.shimmerBase;
    final highlightColor = AppColor.shimmerHighlight;
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
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
                    width: 48,
                    height: 44,
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
                      Container(height: 15, width: 180, color: AppColor.shimmerPlaceholder),
                      const SizedBox(height: 6),
                      Container(height: 20, width: 180, color: AppColor.shimmerPlaceholder),
                    ],
                  ),
                ),
                const Spacer(),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    width: 80,
                    height: 26,
                    decoration: BoxDecoration(
                      color: AppColor.shimmerPlaceholder,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------  animation ad -------------------------------------------------

class NativeBannerB extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final bool isTransparent;

  const NativeBannerB({super.key, this.padding, this.radius, this.isTransparent = false});

  @override
  State<NativeBannerB> createState() => _NativeBannerBState();
}

class _NativeBannerBState extends State<NativeBannerB> {
  NativeAd? _nativeAd;
  bool isLoading = true;
  bool? isDark;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAd();
    });
  }

  Future<void> loadAd() async {
    NativeAd(
      adUnitId: "${AppConfig.unitIdModel?.native}",
      factoryId: 'native_banner',
      customOptions: {
        'backgroundColor': widget.isTransparent ?"#20232C":"#2A2E3A",
        'textColor': '#FFFFFF',
        'subTextColor': '#CDD3E0',
        'buttonColor': '#016BFD',
        'startColor': '#FF6B4A',
      },

      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isLoading = false;
          _nativeAd = ad as NativeAd?;
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          isLoading = false;
          ad.dispose();
          setState(() {});
        },
      ),
      request: const AdRequest(),
    ).load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double targetHeight = (isLoading || _nativeAd == null) ? 0 : 65;
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: SizedBox(
          height: targetHeight,
          width: double.infinity,
          child: _nativeAd != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(widget.radius ?? 0),
                  child: OverflowBox(
                    minHeight: 65,
                    maxHeight: 65,
                    alignment: Alignment.topCenter,
                    child: AdWidget(ad: _nativeAd!),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

// ---------------------------------  divider ad -------------------------------------------------

class NativeBannerD extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final double height;
  final double isDividerHeight;
  final bool isTransparent;
  final bool isFirst;
  final bool isSecond;

  const NativeBannerD({
    super.key,
    this.padding,
    this.radius,
    this.isTransparent = false,
    this.height = 100,
    this.isDividerHeight = 15,
    this.isFirst = true,
    this.isSecond = true,
  });

  @override
  State<NativeBannerD> createState() => _NativeBannerDState();
}

class _NativeBannerDState extends State<NativeBannerD> {
  NativeAd? _nativeAd;
  bool isLoading = true;
  bool? isDark;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAd();
    });
  }

  Future<void> loadAd() async {
    NativeAd(
      adUnitId: "${AppConfig.unitIdModel?.native}",
      factoryId: 'native_banner',
      customOptions: {
        'backgroundColor': "#2A2E3A",
        'textColor': '#FFFFFF',
        'subTextColor': '#CDD3E0',
        'buttonColor': '#016BFD',
        'startColor': '#FF6B4A',
      },
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isLoading = false;
          _nativeAd = ad as NativeAd?;
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          isLoading = false;
          ad.dispose();
          setState(() {});
        },
      ),
      request: const AdRequest(),
    ).load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double targetHeight = (isLoading || _nativeAd == null) ? 0 : widget.height;
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: _nativeAd != null
            ? SizedBox(
                height: targetHeight,
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.isFirst == true ? Divider(height: widget.isDividerHeight) : SizedBox(),
                    Padding(
                      padding: widget.padding ?? EdgeInsets.zero,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(widget.radius ?? 0),
                        child: SizedBox(
                          height: 65,
                          width: double.infinity,
                          child: AdWidget(ad: _nativeAd!),
                        ),
                      ),
                    ),
                    widget.isSecond == true ? Divider(height: widget.isDividerHeight) : SizedBox(),
                  ],
                ),
              )
            : Divider(height: widget.isDividerHeight),
      ),
    );
  }
}

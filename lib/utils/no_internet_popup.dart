import 'package:app_settings/app_settings.dart';
import 'package:cricrush/res/app_assets.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:flutter/material.dart';

class NoInternetPopup extends StatelessWidget {
  final VoidCallback? onTryAgain;
  static bool showingPopUp = false;

  const NoInternetPopup({super.key, this.onTryAgain});

  static show(BuildContext context, {VoidCallback? onTryAgain}) {
    if (showingPopUp) {
      return;
    }
    showingPopUp = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: AppColor.card,
        insetPadding: EdgeInsets.symmetric(horizontal: context.wp(5)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: NoInternetPopup(onTryAgain: onTryAgain),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) {
          showingPopUp = false;
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.hp(2), horizontal: context.wp(5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.noInternet, scale: 6),
            SizedBox(height: context.hp(2)),
            Text(
              'No Internet',
              textAlign: TextAlign.center,
              style: tDmSans(context, fontSize: context.sp(18), fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.hp(0.3)),
            Text(
              'Please check your connection to continue.',
              textAlign: TextAlign.center,
              style: stBarlow(context, fontSize: context.sp(16)),
            ),
            SizedBox(height: context.hp(3)),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: openWifiSettings,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                      decoration: BoxDecoration(color: AppColor.subCard, borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text('Open Settings', style: tDmSans(context, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: context.wp(3)),
                Expanded(
                  child: InkWell(
                    onTap: () => tryAgain(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                      decoration: BoxDecoration(color: AppColor.subCard, borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text('Try Again', style: tDmSans(context, fontWeight: FontWeight.bold)),
                      ),
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

  Future<void> openWifiSettings() async {
    AppSettings.openAppSettings(type: AppSettingsType.wifi);
  }

  void tryAgain(BuildContext context) {
    showingPopUp = false;
    Navigation.pop();
    if (onTryAgain != null) {
      onTryAgain?.call();
    } else {
      Navigation.popAndPushNamed(Routes.splashPage);
    }
  }
}

class ReconnectPopup {
  static bool _isShowing = false;

  static show(BuildContext context) {
    if (_isShowing) return;
    _isShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text("Reconnecting...", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              Text("Slow internet detected. Trying to reconnect...", textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  static hide(BuildContext context) {
    if (_isShowing) {
      _isShowing = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}

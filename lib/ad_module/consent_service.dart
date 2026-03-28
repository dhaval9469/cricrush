import 'dart:async';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class InitializationHelper {
  Future<FormError?> initialize() async {
    try {
      final params = ConsentRequestParameters(tagForUnderAgeOfConsent: false);

      final completer = Completer<FormError?>();

      ConsentInformation.instance.requestConsentInfoUpdate(
        params,
        () async {
          final isFormAvailable = await ConsentInformation.instance.isConsentFormAvailable();
          final status = await ConsentInformation.instance.getConsentStatus();

          if (isFormAvailable && status == ConsentStatus.required) {
            final error = await _loadConsentForm();
            await _initialize();
            completer.complete(error);
          } else {
            await _initialize();
            completer.complete();
          }
        },
        (error) async {
          await _initialize();
          completer.complete(error);
        },
      );

      return completer.future;
    } catch (e) {
      await _initialize();
      return FormError(errorCode: 999, message: e.toString());
    }
  }

  Future<FormError?> _loadConsentForm() async {
    final completer = Completer<FormError?>();

    ConsentForm.loadConsentForm(
      (consentForm) async {
        final status = await ConsentInformation.instance.getConsentStatus();

        if (status == ConsentStatus.required) {
          consentForm.show((formError) async {
            if (formError != null) {
              await _initialize();
              completer.complete(formError);
              return;
            }

            final updatedStatus = await ConsentInformation.instance.getConsentStatus();

            if (updatedStatus == ConsentStatus.obtained ||
                updatedStatus == ConsentStatus.notRequired) {
              await _initialize();
              completer.complete();
            } else {
              final retryError = await _loadConsentForm();
              await _initialize();
              completer.complete(retryError);
            }
          });
        } else {
          await _initialize();
          completer.complete();
        }
      },
      (formError) async {
        await _initialize();
        completer.complete(formError);
      },
    );

    return completer.future;
  }

  Future<void> _initialize() async {
    // MobileAds.instance.updateRequestConfiguration(
    //   RequestConfiguration(
    //     testDeviceIds: ['083B6CE67E2FDC426B7EDD008A7220A8', 'F0B462C3594880468C3C54DB33C62DAB'],
    //   ),
    // );
    await MobileAds.instance.initialize();
  }
}

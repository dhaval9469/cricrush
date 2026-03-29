import 'dart:async';

import 'package:cricrush/ad_module/consent_service.dart';
import 'package:cricrush/cricrush_app.dart';
import 'package:cricrush/helper/local_storage_service.dart';
import 'package:cricrush/utils/remotconfig.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      await Firebase.initializeApp();
      await InitializationHelper().initialize();
      final remoteService = FirebaseRemoteConfigService();
      await remoteService.init();
      await remoteService.getInfoData();
      await AppPref.init();
      runApp(const CricRushApp());
    },
    (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    },
  );
}

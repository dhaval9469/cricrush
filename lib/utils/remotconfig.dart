import 'dart:async';
import 'dart:convert';
import 'package:cricrush/ad_module/unitid_model.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class FirebaseRemoteConfigService {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    try {
      await remoteConfig.ensureInitialized();
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(fetchTimeout: const Duration(seconds: 10), minimumFetchInterval: Duration.zero),
      );
      await remoteConfig.fetchAndActivate();
    } on FirebaseException catch (e) {
      debugPrint('$e');
    }
  }

  String _getJson(String key) {
    final json = remoteConfig.getString(key);
    return json.trim().isEmpty ? "{}" : json;
  }

  Future<UnitIdModel> _parseUnitId() async {
    try {
      return UnitIdModel.fromJson(jsonDecode(_getJson('ad_info')));
    } catch (e) {
      debugPrint("$e");
      return UnitIdModel();
    }
  }

  Future<EndPointModel> _parseEndPoint() async {
    try {
      return EndPointModel.fromJson(jsonDecode(_getJson('end_point')));
    } catch (e) {
      debugPrint("$e");
      return EndPointModel();
    }
  }

  Future<void> getInfoData() async {
    AppConfig.unitIdModel = await _parseUnitId();
    AppConfig.endPoint = await _parseEndPoint();

    AppConfig.iv = remoteConfig.getString('iv_encrypt');
    AppConfig.keyIv = remoteConfig.getString('key_encrypt');
    AppConfig.token = remoteConfig.getString('api_key');
  }
}

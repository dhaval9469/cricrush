import 'dart:convert';
import 'dart:typed_data';

import 'package:cricrush/ad_module/unitid_model.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';

abstract class AppConfig {
  static ValueNotifier<int> bottomIndex = ValueNotifier<int>(0);

  static String allN = 'ALL_N';
  static String lmaN = 'LMA_N';
  static String lmN = 'LM_N';
  static String bnN = 'BN_N';
  static String oN = 'O_N';
  static const String intro = "INTRO";

  static String appShareText = '';

  static UnitIdModel? unitIdModel;
  static EndPointModel? endPoint;

  static String token = '';
  static String iv = "";
  static String keyIv = "=";


  static String decryptAESCryptoJS(Map body) {
    try {
      final String base64Encrypted = body["encrypted"];
      final String base64Key = AppConfig.keyIv;
      final String base64Iv = AppConfig.iv;

      final key = encrypt.Key(Uint8List.fromList(base64Decode(base64Key)));
      final iv = encrypt.IV(Uint8List.fromList(base64Decode(base64Iv)));
      final encryptedData = base64Decode(base64Encrypted);

      final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

      final decrypted = encrypter.decryptBytes(encrypt.Encrypted(encryptedData), iv: iv);
      return utf8.decode(decrypted);
    } catch (e) {
      rethrow;
    }
  }
}

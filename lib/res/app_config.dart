import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';

abstract class AppConfig {
  static ValueNotifier<int> bottomIndex = ValueNotifier<int>(0);

  static String wsUrl = 'ws://139.59.78.33:8001/ws/';
  static String baseUrl = 'http://139.59.78.33:8002/';
  static String token = 'cricktimekworld586985';
  static String iv = "MTIzNDU2NTU1NTM1ODk5OQ==";
  static String keyIv = "MTIzNDU2Nzg5MDEyMzQ1NjU1NTU4OTU4NzE0OTg5OTk=";

  static final String wsAllNew = 'all_new';
  static final String wsIplLive = 'ipl/live/';
  static final String wsLmd = 'live/';
  static final String pyLive = 'live/';
  static final String pyIpl = 'ipl/';
  static final String pyScoreboard = 'scoreboard/';
  static final String pyCommentary = 'commentary/';
  static final String pySquad = 'squad/';
  static final String pyOver = 'over/';
  static final String pyPointTable = 'point_table/';
  static final String pyNewsSortSeri = 'news_sort_seri_new';
  static final String pyPlayers = 'players';
  static final String pyIplSetting = 'ipl_setting';
  static final String pyAllRanking = 'all_ranking';

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

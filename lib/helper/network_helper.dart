import 'dart:async';
import 'dart:convert';
import 'package:cricrush/res/app_config.dart';
import 'package:http/http.dart' as http;

import 'exception_handler.dart';

class NetworkAPICall {
  static final NetworkAPICall _networkAPICall = NetworkAPICall._internal();

  factory NetworkAPICall() {
    return _networkAPICall;
  }

  NetworkAPICall._internal();

  Future<dynamic> post(String baseUrl, String url, dynamic body, {Map<String, String>? header}) async {
    final client = http.Client();

    try {
      final String fullURL = "${AppConfig.baseUrl}$url";
      final response = await client.post(Uri.parse(fullURL), body: body, headers: header);
      if (response.statusCode == 200) {
        return checkResponse(response);
      }
    } catch (e) {
      rethrow;
    } finally {
      client.close();
    }
  }

  Future<dynamic> get(String url, {Map<String, String>? header}) async {
    final client = http.Client();
    try {
      final String fullURL = "${AppConfig.baseUrl}$url";
      final response = await client.get(Uri.parse(fullURL), headers: {"X-Api-Key":AppConfig.token});
      if (response.statusCode == 200) {
        return checkResponse(response);
      }
    } catch (e) {
      client.close();
      rethrow;
    }
  }

  dynamic checkResponse(http.Response response) {
    try {
      switch (response.statusCode) {
        case 200:
          try {
            if (response.body.isEmpty) {
              throw AppException(message: 'Response body is empty', errorCode: 0);
            }
            final send = AppConfig.decryptAESCryptoJS(json.decode(response.body));
            return json.decode(send);
          } catch (e) {
            rethrow;
          }
        default:
          try {
            if (response.body.isEmpty) {
              throw AppException(message: 'Response body is empty', errorCode: response.statusCode);
            }
            final Map<String, dynamic> data = jsonDecode(response.body);
            throw AppException(message: "error : ${data['Error']}", errorCode: response.statusCode);
          } catch (e) {
            rethrow;
          }
      }
    } catch (e) {
      rethrow;
    }
  }
}
import 'dart:async';
import 'dart:convert';

import 'package:cricrush/module/tours/model/tour_ws_model.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TourWSService extends GetxController {
  WebSocketChannel? tourSocket;
  StreamSubscription<dynamic>? _tourStreamSubscription;

  RxBool tourLoading = true.obs;

  RxList<TourAllMatches> tourAllMatches = <TourAllMatches>[].obs;
  bool _isConnecting = false;
  bool _isReconnecting = false;

  var lastPing = DateTime.now().obs;

  Timer? _pingTimer;
  Timer? _monitorTimer;

  RxInt trmIndex = 0.obs;

  RxString tourId = "".obs;
  RxString seriesId = "".obs;

  @override
  void onInit() {
    super.onInit();
    tourId.value = "${AppConfig.endPoint?.tourId}";
    seriesId.value = "${AppConfig.endPoint?.seriesId}";
    connectTourSocket(tourId.value, seriesId.value);
  }

  void connectTourSocket(String tId, String sId) {
    if (_isConnecting) return;
    _isConnecting = true;

    final url = '${AppConfig.endPoint?.wsBaseurl}${AppConfig.endPoint?.wsIplLive}$tId/$sId';

    try {
      tourSocket = IOWebSocketChannel.connect(Uri.parse(url), headers: {"X-Api-Key": AppConfig.token});
      _tourStreamSubscription?.cancel();
      _tourStreamSubscription = tourSocket?.stream.listen(
        (event) => _handleIncoming(event),
        onError: (error) => reconnect(),
        onDone: () => reconnect(),
        cancelOnError: true,
      );

      _startPingTimer();
      _startMonitorTimer();
    } catch (e) {
      debugPrint("🔴 Tour Socket Error => $e");
      reconnect();
    } finally {
      _isConnecting = false;
    }
  }

  void _handleIncoming(dynamic event) {
    try {
      if (event == "pong") {
        lastPing.value = DateTime.now();
        return;
      }

      final decrypted = AppConfig.decryptAESCryptoJS(json.decode(event));
      final decoded = json.decode(decrypted);

      final model = TourWSModel.fromJson(decoded);
      final modelTourId = model.ipl?.tourId;

      if (modelTourId != tourId.value.toString()) {
        return;
      }

      final newMatches = model.ipl?.matches ?? [];
      tourAllMatches.assignAll(newMatches);

      tourLoading.value = false;
    } catch (e) {
      debugPrint("⚠ Tour Error => $e");
    }
  }

  void changeTour({required String newTourId, required String newSeriesId}) {
    tourLoading.value = true;
    tourId.value = newTourId;
    seriesId.value = newSeriesId;

    disconnectSocket(clearData: false);
    tourAllMatches.clear();
    connectTourSocket(newTourId, newSeriesId);
  }

  /// Ping Timer
  void _startPingTimer() {
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (tourSocket != null) _sendPing();
    });
  }

  void _sendPing() {
    tourSocket?.sink.add('ping');
  }

  void _stopPingTimer() => _pingTimer?.cancel();

  /// Monitor Timer
  void _startMonitorTimer() {
    _monitorTimer?.cancel();
    _monitorTimer = Timer.periodic(const Duration(seconds: 15), (_) {
      if (tourSocket != null) {
        final sinceLastPing = DateTime.now().difference(lastPing.value);
        if (sinceLastPing.inSeconds > 25) {
          reconnect();
        }
      }
    });
  }

  void _stopMonitorTimer() => _monitorTimer?.cancel();

  void _stopTimers() {
    _stopPingTimer();
    _stopMonitorTimer();
  }

  /// 🔹 Safe reconnect
  void reconnect() async {
    if (_isReconnecting) return;
    _isReconnecting = true;

    _stopTimers();
    disconnectSocket(clearData: false);

    await Future.delayed(const Duration(seconds: 3));

    connectTourSocket(tourId.value, seriesId.value);

    _isReconnecting = false;
  }

  /*  void reconnect() async {
    await Future.delayed(Duration(seconds: 3));
    connectTourSocket();
  }*/

  void disconnectSocket({bool clearData = true}) {
    try {
      _tourStreamSubscription?.cancel();
      _tourStreamSubscription = null;

      tourSocket?.sink.close();
      tourSocket = null;

      _stopTimers();

      if (clearData) {
        tourAllMatches.clear();
      }
    } catch (e) {
      debugPrint("error: $e");
    }
  }

  @override
  void onClose() {
    disconnectSocket();
    super.onClose();
  }
}

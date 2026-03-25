import 'dart:async';
import 'dart:convert';
import 'package:cricrush/module/match_details/model/lmw_model.dart';
import 'package:cricrush/module/match_details/service/match_details_ser.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class LMWService extends GetxController {
  WebSocketChannel? _lmdSocket;
  StreamSubscription<dynamic>? _lmdStreamSubscription;

  RxString matchId = "".obs;
  RxBool lmdLoading = false.obs;

  Rx<WSLSDetailsModel?> wsScoreLMDetailsModel = Rx(null);

  bool _isConnecting = false;
  bool _isReconnecting = false;

  var lastPing = DateTime.now().obs;

  Timer? _pingTimer;
  Timer? _monitorTimer;

  /// Open a match
  void openMatch(String newId) {
    // if (matchId.value == newId) return;
    lmdLoading.value = true;
    matchId.value = newId;

    wsScoreLMDetailsModel.value = null;
    disconnectSocket(clearUI: false);
    _connectSocket(newId);
  }

  /// Connect WebSocket
  void _connectSocket(String id) {
    if (_isConnecting) return;
    _isConnecting = true;

    final url = '${AppConfig.wsUrl}${AppConfig.wsLmd}$id';

    try {
      // _lmdSocket = WebSocketChannel.connect(Uri.parse(url));
      _lmdSocket = IOWebSocketChannel.connect(Uri.parse(url), headers: {"X-Api-Key": AppConfig.token});

      _lmdStreamSubscription?.cancel();
      _lmdStreamSubscription = _lmdSocket?.stream.listen(
        _onMessage,
        onError: (e, st) {
          _reconnect();
        },
        onDone: () {
          _reconnect();
        },
        cancelOnError: true,
      );

      _startPingTimer();
      _startMonitorTimer();
    } catch (e) {
      debugPrint("$e");
      _reconnect();
    } finally {
      _isConnecting = false;
    }
  }

  /// Handle Incoming WebSocket Data
  void _onMessage(dynamic event) {
    try {
      if (event == "pong") {
        lastPing.value = DateTime.now();

        return;
      }

      final decrypted = AppConfig.decryptAESCryptoJS(json.decode(event));
      final jsonData = json.decode(decrypted);
      final model = LMWModel.fromJson(jsonData);

      wsScoreLMDetailsModel.value = model.data;
      lmdLoading.value = false;
    } catch (e) {
      debugPrint("$e");
    }
  }

  /// Ping Timer
  void _startPingTimer() {
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (_lmdSocket != null) _sendPing();
    });
  }

  void _sendPing() {
    _lmdSocket?.sink.add('ping');
  }

  void _stopPingTimer() => _pingTimer?.cancel();

  /// Monitor Timer
  void _startMonitorTimer() {
    _monitorTimer?.cancel();
    _monitorTimer = Timer.periodic(const Duration(seconds: 15), (_) {
      if (_lmdSocket != null) {
        final sinceLastPing = DateTime.now().difference(lastPing.value);
        if (sinceLastPing.inSeconds > 25) {
          _reconnect();
        }
      }
    });
  }

  void _stopMonitorTimer() => _monitorTimer?.cancel();

  void _stopTimers() {
    _stopPingTimer();
    _stopMonitorTimer();
  }

  /// Reconnect WebSocket
  void _reconnect() async {
    if (_isReconnecting) return;
    _isReconnecting = true;

    _stopTimers();
    disconnectSocket(clearUI: false);

    await Future.delayed(const Duration(seconds: 3));

    if (matchId.value.isNotEmpty) {
      _connectSocket(matchId.value);
    }

    _isReconnecting = false;
  }

  /// Disconnect WebSocket
  void disconnectSocket({bool clearUI = true}) {
    try {
      // if(!_isSocketConnnect) return;
      _lmdStreamSubscription?.cancel();
      _lmdStreamSubscription = null;

      _lmdSocket?.sink.close();
      _lmdSocket = null;

      _stopTimers();

      if (clearUI) {
        wsScoreLMDetailsModel.value = null;
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  void onClose() {
    disconnectSocket();
    super.onClose();
  }

  Future<void> getLSDFUR(String? matchId) async {
    try {
      lmdLoading.value = true;
      wsScoreLMDetailsModel.value = null;
      final model = await MatchDetailsSer().lmDetails(matchId: matchId);
      if (model.data != null) {
        wsScoreLMDetailsModel.value = model.data;
      } else {
        wsScoreLMDetailsModel.value = null;
      }
    } catch (e) {
      wsScoreLMDetailsModel.value = null;
      debugPrint("❌ Error → $e");
    } finally {
      lmdLoading.value = false;
    }
  }
}

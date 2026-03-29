import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

@pragma('vm:entry-point')
void _onDidReceiveBackgroundNotificationResponse(NotificationResponse response) {
  NotificationService.instance._handleTap(response.payload);
}

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  static NotificationService get instance => _instance;

  NotificationService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _local = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await _requestPermissions();
    await _initLocalNotifications();
    await _initFirebaseMessaging();
  }

  Future<void> _requestPermissions() async {
    await Permission.notification.request();
  }

  Future<void> _initLocalNotifications() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();

    const initSettings = InitializationSettings(android: androidInit, iOS: iosInit);

    await _local.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (response) {
        _handleTap(response.payload);
      },
      onDidReceiveBackgroundNotificationResponse: _onDidReceiveBackgroundNotificationResponse,
    );
  }

  Future<void> _initFirebaseMessaging() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    await _messaging.subscribeToTopic("cricrush");

    /// Foreground
    FirebaseMessaging.onMessage.listen((msg) {
      /// Prevent duplicate notification
      if (msg.notification != null) {
        showNotification(msg);
      }
    });

    /// App opened from background
    FirebaseMessaging.onMessageOpenedApp.listen((msg) {
      _handleTap(msg.data['action']);
    });

    /// App opened from terminated state
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleTap(initialMessage.data['action']);
    }

    await _messaging.setForegroundNotificationPresentationOptions(
      alert: false, // IMPORTANT (avoid duplicate on iOS)
      badge: true,
      sound: true,
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    final title = message.notification?.title ?? message.data['title'];
    final body = message.notification?.body ?? message.data['body'];

    if (title == null && body == null) return;

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    const androidDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'BTC Alerts',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      icon: '@mipmap/ic_launcher',
      visibility: NotificationVisibility.public,
    );

    const iOSDetails = DarwinNotificationDetails();

    await _local.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(android: androidDetails, iOS: iOSDetails),
      payload: message.data['action'],
    );
  }

  void _handleTap(String? payload) {
    // navigation logic
  }
}

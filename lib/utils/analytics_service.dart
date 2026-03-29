import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  // Singleton setup
  static final AnalyticsService _instance = AnalyticsService._internal();

  factory AnalyticsService() => _instance;

  AnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalytics get analytics => _analytics;

  FirebaseAnalyticsObserver get observer => FirebaseAnalyticsObserver(analytics: _analytics);

  // Log generic event
  Future<void> logEvent({required String name, Map<String, Object>? parameters}) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  // Log screen view
  Future<void> logScreen(String screenName) async {
    await _analytics.logScreenView(screenName: screenName);
  }

  // Log login
  Future<void> logLogin(String method) async {
    await _analytics.logLogin(loginMethod: method);
  }

  // Log sign up
  Future<void> logSignUp(String method) async {
    await _analytics.logSignUp(signUpMethod: method);
  }

  // Log purchase (example)
  Future<void> logPurchase({required double value, required String currency}) async {
    await _analytics.logPurchase(value: value, currency: currency);
  }

  // Set user ID
  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(id: userId);
  }

  // Set user properties
  Future<void> setUserProperty({required String name, required String value}) async {
    await _analytics.setUserProperty(name: name, value: value);
  }
}

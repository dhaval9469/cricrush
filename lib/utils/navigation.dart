import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigation {
  /// Push with default navigation
  static Future<dynamic>? push(Widget page) {
    FocusManager.instance.primaryFocus?.unfocus();
    return Get.to(() => page);
  }

  /// Push using named route
  static Future<dynamic>? pushNamed(String routeName, {dynamic arg, Map<String, String>? params}) {
    FocusManager.instance.primaryFocus?.unfocus();
    return Get.toNamed(routeName, arguments: arg, parameters: params);
  }

  /// Replace current screen & push new route
  static void popAndPushNamed(String routeName, {dynamic arg, Map<String, String>? params}) {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.offAndToNamed(routeName, arguments: arg, parameters: params);
  }

  /// Transitions
  static Future<dynamic>? leftToRight(Widget page) {
    FocusManager.instance.primaryFocus?.unfocus();
    return Get.to(() => page, transition: Transition.leftToRight);
  }

  static Future<dynamic>? rightToLeft(Widget page) {
    FocusManager.instance.primaryFocus?.unfocus();
    return Get.to(() => page, transition: Transition.rightToLeft);
  }

  /// Replace the current screen
  static void replace(String routeName, {dynamic arguments}) {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.offNamed(routeName, arguments: arguments);
  }

  /// Go Back
  static void pop({dynamic result}) {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.back(result: result);
  }

  /// Pop 2 screens
  static void doublePop() {
    Get
      ..back()
      ..back();
  }

  /// Clear all screens & open only this one
  static void removeAll(Widget page) {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.offAll(() => page);
  }

  /// Remove screens until routeName matches
  static void popUntil(String routeName) {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.until((route) => route.settings.name == routeName);
  }

  /// Remove all & push named route
  static void replaceAll(String routeName, {dynamic arg, Map<String, String>? params}) {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.offAllNamed(routeName, arguments: arg, parameters: params);
  }
}

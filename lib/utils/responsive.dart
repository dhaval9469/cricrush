import 'package:flutter/widgets.dart';

extension ResponsiveExt on BuildContext {
  /// MediaQuery shortcut
  Size get _size => MediaQuery.of(this).size;

  /// Height in % → hp(2) = 2% of screen height
  double hp(double percent) => _size.height * (percent / 100);

  /// Width in % → wp(5) = 5% of screen width
  double wp(double percent) => _size.width * (percent / 100);

  /// Scaling based on reference width (fonts, padding)
  double sp(double size, {double baseWidth = 390}) =>
      size * (_size.width / baseWidth);

  /// Check device categories
  bool get isPhone => _size.width < 600;
  bool get isTablet => _size.width >= 600 && _size.width < 900;
  bool get isDesktop => _size.width >= 900;
}

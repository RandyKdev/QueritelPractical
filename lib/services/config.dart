import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConfigService {
  MediaQueryData? mediaQueryData;

  final double _minDesktopWidth = 672;
  double? _screenWidth;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    _screenWidth = mediaQueryData!.size.width;
  }

  bool get isDesktop => _screenWidth! >= _minDesktopWidth;
  double get screenWidth => _screenWidth!;

  bool get isWeb => kIsWeb;
}

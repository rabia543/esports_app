import 'package:flutter/material.dart';

import 'app_colors.dart';

// Shadow effects for cards and elevated elements
class AppShadows {
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 8.0,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> subtleShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 4.0,
      offset: const Offset(0, 2),
    ),
  ];
}

// Font families used in the app
class AppFonts {
  static const String lctPicon = 'LCT Picon';
  static const String suisseIntlMono = 'Suisse Intl Mono';
  static const String poppins = 'Poppins';
  static const String defaultFont = 'Roboto';

  // Easy access to font families
  static String get title => lctPicon;
  static String get subtitle => suisseIntlMono;
  static String get body => defaultFont;

  // Reusable text styles
  static TextStyle titleStyle({
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.bold,
    Color color = AppColors.textWhite,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? lctPicon,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle subtitleStyle({
    double fontSize = 12.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.textGray,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? suisseIntlMono,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle bodyStyle({
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.textWhite,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? defaultFont,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

// Font sizes for different text elements
class AppFontSize {
  static const double xs = 10.0;
  static const double sm = 12.0;
  static const double md = 14.0;
  static const double lg = 16.0;
  static const double xl = 18.0;
  static const double xxl = 20.0;
}

// Icon sizes for consistent UI elements
class AppIconSize {
  static const double xs = 12.0;
  static const double sm = 16.0;
  static const double md = 20.0;
  static const double lg = 24.0;
  static const double xl = 28.0;
  static const double xxl = 32.0;
  static const double llg = 36.0;
  static const double elo = 42.0;
}

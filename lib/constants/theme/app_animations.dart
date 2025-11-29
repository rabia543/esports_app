import 'package:flutter/material.dart';

// Animation duration constants
class AnimationDurations {
  AnimationDurations._();

  static const Duration short = Duration(milliseconds: 300);
  static const Duration medium = Duration(milliseconds: 600);
  static const Duration long = Duration(milliseconds: 900);
}

// Animation curve constants
class AnimationCurves {
  AnimationCurves._();

  static const Curve easeOut = Curves.easeOut;
  static const Curve easeIn = Curves.easeIn;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve bounceOut = Curves.bounceOut;
  static const Curve elasticOut = Curves.elasticOut;
}

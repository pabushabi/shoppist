import 'package:flutter/material.dart';

Color? getColorForValue(
  double value, {
  Color? startColor,
  Color? endColor,
}) {
  double clampedValue = value.clamp(0.0, 1.0);
  final red = HSVColor.fromColor(startColor ?? Colors.red);
  final green = HSVColor.fromColor(endColor ?? Colors.green);
  final interpolatedColor = HSVColor.lerp(red, green, clampedValue);
  return interpolatedColor?.toColor().withAlpha(100);
}

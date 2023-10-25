import 'package:flutter/material.dart';

class DividerSettings {
  final double indent;
  final double endIndent;
  final double thickness;
  final BoxDecoration? decoration;
  final Duration? duration;
  final Curve? curve;
  final bool isHideAutomatically;

  const DividerSettings({
    this.indent = 0,
    this.endIndent = 0,
    this.thickness = 1,
    this.decoration,
    this.duration,
    this.curve,
    this.isHideAutomatically = true,
  });

  @override
  bool operator ==(Object other) {
    return other is DividerSettings &&
        identical(indent, other.indent) &&
        identical(endIndent, other.endIndent) &&
        identical(thickness, other.thickness) &&
        identical(decoration, other.decoration) &&
        identical(duration, other.duration) &&
        identical(curve, other.curve) &&
        identical(isHideAutomatically, other.isHideAutomatically);
  }

  @override
  int get hashCode => Object.hashAll([indent, endIndent, thickness, decoration]);
}

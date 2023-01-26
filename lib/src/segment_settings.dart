import 'package:flutter/material.dart';

class CustomSegmentSettings {
  final Color? splashColor;
  final Color? highlightColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final BorderRadius? borderRadius;
  final double? radius;
  final MaterialStateProperty<Color?>? overlayColor;
  final Color? hoverColor;
  final MouseCursor? mouseCursor;

  CustomSegmentSettings({
    this.splashColor,
    this.highlightColor,
    this.splashFactory,
    this.borderRadius,
    this.radius,
    this.overlayColor,
    this.hoverColor,
    this.mouseCursor,
  });
}

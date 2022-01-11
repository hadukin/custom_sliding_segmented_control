import 'package:flutter/material.dart';

class AnimationPanel<T> extends StatelessWidget {
  const AnimationPanel({
    Key? key,
    required this.offset,
    required this.width,
    required this.height,
    required this.hasTouch,
    this.elevation,
    this.duration,
    this.radius = 24,
    this.color,
    this.curve,
    this.decoration,
  }) : super(key: key);

  final double offset;
  final double? width;
  final double? height;
  final double radius;
  final double? elevation;
  final Duration? duration;
  final Color? color;
  final Curve? curve;
  final bool hasTouch;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final _offset = isRtl ? offset * -1 : offset;

    return AnimatedContainer(
      transform: Matrix4.translationValues(_offset, 0, 0),
      duration: hasTouch == false
          ? const Duration()
          : duration ?? const Duration(milliseconds: 200),
      curve: curve!,
      width: width,
      decoration: decoration?.copyWith(
        borderRadius: decoration?.borderRadius ?? BorderRadius.circular(radius),
        color: decoration?.color ?? color,
      ),
      child: Container(height: height),
    );
  }
}

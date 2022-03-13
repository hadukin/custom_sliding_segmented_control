import 'package:flutter/material.dart';

class AnimationPanel<T> extends StatelessWidget {
  const AnimationPanel({
    Key? key,
    required this.offset,
    required this.width,
    required this.height,
    required this.hasTouch,
    this.duration,
    this.curve,
    this.decoration,
  }) : super(key: key);

  final double offset;
  final double? width;
  final double? height;
  final Duration? duration;
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
          ? Duration.zero
          : duration ?? const Duration(milliseconds: 200),
      curve: curve!,
      width: width,
      decoration: decoration,
      height: height,
    );
  }
}

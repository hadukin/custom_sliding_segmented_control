import 'package:flutter/material.dart';

class AnimationPanel<T> extends StatelessWidget {
  const AnimationPanel({
    super.key,
    required this.offset,
    required this.width,
    required this.height,
    required this.hasTouch,
    required this.duration,
    required this.curve,
    this.decoration,
  });

  final double offset;
  final double? width;
  final double? height;
  final Duration duration;
  final Curve curve;
  final bool hasTouch;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final _offset = isRtl ? offset * -1 : offset;

    return AnimatedContainer(
      transform: Matrix4.translationValues(_offset, 0, 0),
      duration: hasTouch == false ? Duration.zero : duration,
      curve: curve,
      width: width,
      decoration: decoration,
      height: height,
    );
  }
}

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
    this.radius,
    this.color,
    this.curve,
  }) : super(key: key);

  final double offset;
  final double? width;
  final double? height;
  final double? radius;
  final double? elevation;
  final Duration? duration;
  final Color? color;
  final Curve? curve;
  final bool hasTouch;

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
      child: PhysicalModel(
        elevation: elevation!,
        clipBehavior: Clip.antiAlias,
        color: color!,
        borderRadius: BorderRadius.circular(radius!),
        child: Container(height: height),
      ),
    );
  }
}

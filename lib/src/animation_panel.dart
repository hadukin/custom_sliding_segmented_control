import 'package:flutter/material.dart';

class AnimationPanel<T> extends StatelessWidget {
  const AnimationPanel({
    Key key,
    @required this.offset,
    @required this.width,
    @required this.height,
    this.elevation,
    this.duration,
    this.radius,
    this.color,
    this.curve,
  }) : super(key: key);

  final double offset;
  final double width;
  final double height;
  final double radius;
  final double elevation;
  final Duration duration;
  final Color color;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(offset, 0, 0),
      duration: duration ?? const Duration(milliseconds: 200),
      curve: curve,
      width: width,
      child: PhysicalModel(
        elevation: elevation,
        clipBehavior: Clip.antiAlias,
        color: color,
        borderRadius: BorderRadius.circular(radius),
        child: Container(height: height),
      ),
    );
  }
}

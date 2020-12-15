import 'package:flutter/material.dart';

class AnimationPanel extends StatelessWidget {
  const AnimationPanel({
    Key key,
    @required this.offset,
    @required this.width,
    @required this.text,
    this.elevation,
    this.duration,
    this.radius,
    this.color,
    this.curve,
    this.padding,
  }) : super(key: key);

  final double offset;
  final double width;
  final double radius;
  final double elevation;
  final double padding;
  final String text;
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
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
            text,
            maxLines: 1,
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}

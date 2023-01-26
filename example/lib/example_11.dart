import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class Example11 extends StatefulWidget {
  const Example11({super.key});

  @override
  State<Example11> createState() => _Example11State();
}

class _Example11State extends State<Example11> {
  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl(
      innerPadding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.transparent,
      ),
      thumbDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAlias,
      initialValue: 'value',
      children: const {
        'value': Text('Current value'),
        'range': Text('Selected range'),
      },
      onValueChanged: (value) {},
      onHoverSegment: (value, isHover) {
        print('$value | $isHover');
      },
      customSegmentSettings: CustomSegmentSettings(
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}

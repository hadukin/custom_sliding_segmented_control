import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class Example6 extends StatefulWidget {
  const Example6({super.key});

  @override
  State<Example6> createState() => _Example6State();
}

class _Example6State extends State<Example6> {
  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      children: const {
        1: Text(
          'Segmentation',
          textAlign: TextAlign.center,
        ),
        2: Text(
          'Max',
          textAlign: TextAlign.center,
        ),
      },
      onValueChanged: (int value) {
        print(value);
      },
    );
  }
}

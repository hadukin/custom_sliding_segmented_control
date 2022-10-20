import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      initialValue: 2,
      padding: 20,
      children: const {
        1: Text(
          'News daily portal',
          style: TextStyle(color: Colors.white),
        ),
        2: Text(
          'Map',
          style: TextStyle(color: Colors.white),
        ),
        3: Text(
          'Paper',
          style: TextStyle(color: Colors.white),
        ),
      },
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      thumbDecoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(6),
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      onValueChanged: (v) {
        print(v);
      },
    );
  }
}

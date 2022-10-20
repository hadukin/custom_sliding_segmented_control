import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class Example10 extends StatefulWidget {
  const Example10({super.key});

  @override
  State<Example10> createState() => _Example10State();
}

class _Example10State extends State<Example10> {
  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      fromMax: true,
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
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      thumbDecoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: const Offset(
              0.0,
              2.0,
            ),
          ),
        ],
      ),
      onValueChanged: (int value) {
        print(value);
      },
    );
  }
}

import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class Example12 extends StatefulWidget {
  const Example12({super.key});

  @override
  State<Example12> createState() => _Example12State();
}

class _Example12State extends State<Example12> {
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
        3: Text(
          'News',
          textAlign: TextAlign.center,
        ),
      },
      dividerSettings: DividerSettings(
        thickness: 2,
        endIndent: 8,
        indent: 8,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      isShowDivider: true,
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

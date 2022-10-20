import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:example/enums.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';

class Example7 extends StatefulWidget {
  const Example7({super.key});

  @override
  State<Example7> createState() => _Example7State();
}

class _Example7State extends State<Example7> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomSlidingSegmentedControl<SegmentType>(
        initialValue: SegmentType.map,
        isStretch: true,
        children: const {
          SegmentType.news: Text(
            'Flights',
            textAlign: TextAlign.center,
          ),
          SegmentType.map: Text(
            'Map',
            textAlign: TextAlign.center,
          ),
        },
        innerPadding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(14),
        ),
        thumbDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        onValueChanged: (v) {
          print(v);
        },
      ),
    );
  }
}

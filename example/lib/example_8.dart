import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:example/enums.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';

class Example8 extends StatefulWidget {
  const Example8({super.key});

  @override
  State<Example8> createState() => _Example8State();
}

class _Example8State extends State<Example8> {
  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<SegmentType>(
      children: const {
        SegmentType.news: Text('News'),
        SegmentType.map: Text('Map'),
        SegmentType.paper: Text('Flights'),
      },
      thumbDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.7, 0.0),
          colors: [
            Color(0xffee0000),
            Color(0xffeeee00),
          ],
        ),
      ),
      onValueChanged: (v) {
        print(v);
      },
    );
  }
}

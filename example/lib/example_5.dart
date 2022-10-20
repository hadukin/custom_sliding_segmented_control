import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Example5 extends StatefulWidget {
  const Example5({super.key});

  @override
  State<Example5> createState() => _Example5State();
}

class _Example5State extends State<Example5> {
  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      // controller: controller,
      isStretch: true,
      initialValue: 2,
      height: 24,
      children: const {
        0: Text('News daily portal'),
        1: Text('Map'),
        2: Text('Paper'),
      },
      decoration: BoxDecoration(
        color: CupertinoColors.lightBackgroundGray,
        borderRadius: BorderRadius.circular(8),
      ),
      thumbDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
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
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      onValueChanged: (v) {
        print(v);
      },
    );
  }
}

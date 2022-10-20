import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class Example9 extends StatefulWidget {
  const Example9({super.key});

  @override
  State<Example9> createState() => _Example9State();
}

class _Example9State extends State<Example9> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomSlidingSegmentedControl<int>(
        thumbDecoration: BoxDecoration(
          color: Colors.white,
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
        fromMax: true,
        children: const {
          1: Text(
            'Directionality',
            textAlign: TextAlign.center,
          ),
          2: Text(
            'Rtl',
            textAlign: TextAlign.center,
          ),
        },
        onValueChanged: (int value) {
          print(value);
        },
      ),
    );
  }
}

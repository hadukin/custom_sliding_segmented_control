import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  BorderRadius dynamicBorder = const BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      fromMax: true,
      height: 30,
      innerPadding: EdgeInsets.zero,
      children: const {
        0: Text("FLIGHTS"),
        1: Text("TRAINS"),
        2: Text("HOTELS"),
      },
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: 20,
      thumbDecoration: BoxDecoration(
        borderRadius: dynamicBorder,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.7, 0.0),
          colors: [
            Color(0xff5851db),
            Color(0xffe1306c),
          ],
        ),
      ),
      onValueChanged: (int value) {
        switch (value) {
          case 0:
            setState(() {
              dynamicBorder = const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(0),
              );
            });
            break;
          case 1:
            setState(() {
              dynamicBorder = const BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(0),
              );
            });
            break;
          case 2:
            setState(() {
              dynamicBorder = const BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              );
            });
            break;
          default:
        }
      },
    );
  }
}

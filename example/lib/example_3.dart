import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:example/enums.dart';
import 'package:example/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  TestType initialTestType = TestType.max;
  int initial = 1;
  bool isPayment = false;
  late final CustomSegmentedController<int> controller;

  @override
  void initState() {
    super.initState();
    controller = CustomSegmentedController();
    controller.addListener(() {
      print('listener ${controller.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    initial = 3;
                  });
                },
                child: const Text('change initial'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPayment = !isPayment;
                  });
                },
                child: const Text('add segment'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  controller.value = 1;
                },
                child: const Text('controller'),
              ),
            ),
          ],
        ),
        CustomSlidingSegmentedControl<int>(
          initialValue: initial,
          height: 24,
          controller: controller,
          children: {
            1: const Text('News daily portal'),
            2: const Text('Map'),
            3: const Text('Paper'),
            if (isPayment) 4: const Text('Metal Bord'),
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
          onValueChanged: (v) {},
        ),
      ],
    );
  }
}

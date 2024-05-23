import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Pet { none, cat, dog, bird, snake }

class Example15 extends StatefulWidget {
  const Example15({super.key});

  @override
  State<Example15> createState() => _Example15State();
}

class _Example15State extends State<Example15> {
  final _controller = CustomSegmentedController<Pet>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSlidingSegmentedControl<Pet>(
          controller: _controller,
          height: 48,
          isStretch: true,
          isShowDivider: true,
          dividerSettings: DividerSettings(indent: 12, endIndent: 12),
          innerPadding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFD1D1D6),
            borderRadius: BorderRadius.circular(100),
          ),
          thumbDecoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          curve: Curves.easeOutCubic,
          // initialValue: Pet.none,
          children: Map<Pet, Widget>.fromIterable(
            Pet.values,
            key: (pet) => pet as Pet,
            value: (vale) {
              final pet = vale as Pet;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    pet.name,
                    style: TextStyle(color: pet != Pet.snake ? Colors.black : Colors.grey),
                  ),
                ],
              );
            },
          ),
          onTapSegment: (value) {
            if (value == Pet.snake) return false;
            return true;
          },
          onValueChanged: (pet) {
            _controller.value = pet;
          },
        ),
      ],
    );
  }
}

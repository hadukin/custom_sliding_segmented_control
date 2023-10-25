import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';

enum Pet { none, cat, dog, bird, snake }

class Example13 extends StatefulWidget {
  const Example13({super.key});

  @override
  State<Example13> createState() => _Example13State();
}

class _Example13State extends State<Example13> {
  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<Pet>(
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
      initialValue: Pet.none,
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
              ),
            ],
          );
        },
      ),
      onValueChanged: (pet) {},
    );
  }
}

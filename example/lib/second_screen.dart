import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:example/enums.dart';
import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second View'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                initialValue: SegmentType.paper,
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
                  SegmentType.paper: Text(
                    'News',
                    textAlign: TextAlign.center,
                  ),
                },
                onValueChanged: (v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                initialValue: SegmentType.map,
                children: const {
                  SegmentType.news: Text(
                    'News daily portal',
                    style: TextStyle(color: Colors.white),
                  ),
                  SegmentType.map: Text(
                    'Map',
                    style: TextStyle(color: Colors.white),
                  ),
                  SegmentType.paper: Text(
                    'Flights',
                    style: TextStyle(color: Colors.white),
                  ),
                },
                innerPadding: EdgeInsets.zero,
                thumbDecoration: const BoxDecoration(color: Colors.blue),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInToLinear,
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum SegmentType { news, map, paper }
enum TestType { segmentation, max, news }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TestType initialTestType = TestType.max;
  int initial = 1;
  bool isPayment = false;
  int initialValue = 0;
  late final CustomSegmentedController<int> controller;

  @override
  void initState() {
    super.initState();
    controller = CustomSegmentedController();
  }

  BorderRadius dynamicBorder = const BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$initialTestType'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      initialTestType = TestType.max;
                      initial = 3;
                    });
                  },
                  child: const Text('change initial'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isPayment = !isPayment;
                    });
                  },
                  child: const Text('add new segment'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl<int>(
              controller: controller,
              initialValue: initial,
              height: 24,
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
              onValueChanged: (v) {
                controller.value = v;
                setState(() {
                  initial = v;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl<int>(
              controller: controller,
              children: const {
                1: Text(
                  'Segmentation',
                  textAlign: TextAlign.center,
                ),
                2: Text(
                  'Max',
                  textAlign: TextAlign.center,
                ),
              },
              onValueChanged: (int value) {
                print(value);
              },
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl<int>(
              controller: controller,
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
                print(value);
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
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl<int>(
              controller: controller,
              initialValue: 2,
              padding: 20,
              children: const {
                1: Text(
                  'News daily portal',
                  style: TextStyle(color: Colors.white),
                ),
                2: Text(
                  'Map',
                  style: TextStyle(color: Colors.white),
                ),
                3: Text(
                  'Paper',
                  style: TextStyle(color: Colors.white),
                ),
              },
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              thumbDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(6),
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInToLinear,
              onValueChanged: (v) {
                print(v);
              },
            ),
            const SizedBox(height: 20),
            Padding(
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
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl<SegmentType>(
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
            ),
            const SizedBox(height: 20),
            Directionality(
              textDirection: TextDirection.rtl,
              child: CustomSlidingSegmentedControl<int>(
                controller: controller,
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
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl<int>(
              controller: controller,
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
              },
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
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl<SegmentType>(
              initialValue: SegmentType.news,
              children: const {
                SegmentType.paper: Text(
                  'Paper',
                  textAlign: TextAlign.center,
                ),
                SegmentType.map: Text(
                  'Map',
                  textAlign: TextAlign.center,
                ),
                SegmentType.news: Text(
                  'News',
                  textAlign: TextAlign.center,
                ),
              },
              onValueChanged: (v) {
                print(v);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push<void>(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SecondView();
                    },
                  ),
                );
              },
              child: const Text('Go to second screen'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

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

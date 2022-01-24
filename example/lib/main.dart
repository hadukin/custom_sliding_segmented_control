import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

void main() {
  runApp(MyApp());
}

enum SegmentType { news, map, paper }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      // theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BorderRadius dynamicBorder = BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Sliding Segmented'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) {
                        return SecondView();
                      },
                    ),
                  );
                },
                child: Text('Go to second screen'),
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<int>(
                radius: 20,
                fromMax: true,
                innerPadding: 0,
                children: {
                  0: Text("FLIGHTS"),
                  1: Text("TRAINS"),
                  2: Text("HOTELS")
                },
                thumbDecoration: BoxDecoration(
                  borderRadius: dynamicBorder,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.7, 0.0),
                    colors: [
                      const Color(0xff5851db),
                      const Color(0xffe1306c),
                    ],
                  ),
                ),
                onValueChanged: (int value) {
                  print(value);
                  switch (value) {
                    case 0:
                      setState(() {
                        dynamicBorder = BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(0),
                          topRight: Radius.circular(0),
                        );
                      });
                      break;
                    case 1:
                      setState(() {
                        dynamicBorder = BorderRadius.only(
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topRight: Radius.circular(0),
                        );
                      });
                      break;
                    case 2:
                      setState(() {
                        dynamicBorder = BorderRadius.only(
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
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomSlidingSegmentedControl<int>(
                  thumbDecoration: BoxDecoration(
                    // color: Colors.greenAccent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      ),
                    ],
                  ),
                  fromMax: true,
                  children: {
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
                fromMax: true,
                children: {
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
              CustomSlidingSegmentedControl<SegmentType>(
                initialValue: SegmentType.map,
                isStretch: true,
                children: {
                  SegmentType.news: Text(
                    'Flights',
                    textAlign: TextAlign.center,
                  ),
                  SegmentType.map: Text(
                    'Map',
                    textAlign: TextAlign.center,
                  ),
                },
                radius: 8,
                innerPadding: 2,
                padding: EdgeInsets.all(20),
                onValueChanged: (v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                initialValue: SegmentType.map,
                children: {
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
                innerPadding: 2,
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.black,
                thumbDecoration: BoxDecoration(color: Colors.blue),
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInToLinear,
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                children: {
                  SegmentType.news: Text('News'),
                  SegmentType.map: Text('Map'),
                  SegmentType.paper: Text('Flights'),
                },
                radius: 8,
                thumbDecoration: BoxDecoration(color: Colors.white),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.7, 0.0),
                    colors: [
                      const Color(0xffee0000),
                      const Color(0xffeeee00)
                    ], // red to yellow
                  ),
                ),
                onValueChanged: (v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                children: {
                  SegmentType.news: Text('News'),
                  SegmentType.map: Text('Map'),
                  SegmentType.paper: Text('Flights'),
                },
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<int>(
                children: {
                  0: Text('News'),
                  1: Text('Map'),
                  2: Text('Flights'),
                },
                duration: Duration(milliseconds: 200),
                radius: 30.0,
                onValueChanged: (int index) {
                  print(index);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                fixedWidth: 100,
                children: {
                  SegmentType.news: Text('Flights'),
                  SegmentType.map: Text('1'),
                  SegmentType.paper: Text('2'),
                },
                radius: 5,
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<String>(
                children: {
                  'News': Text('News'),
                  'Map': Text('Map'),
                  'Flights': Text('Flights'),
                },
                duration: Duration(milliseconds: 200),
                radius: 0.0,
                onValueChanged: (String v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                innerPadding: 4,
                children: {
                  SegmentType.news: Text('News'),
                  SegmentType.map: Text('Map'),
                  SegmentType.paper: Text('Flight'),
                },
                radius: 10,
                thumbDecoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    ),
                  ],
                ),
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                children: {
                  SegmentType.news: Text('Flights'),
                  SegmentType.map: Text('Map'),
                  SegmentType.paper: Text('News'),
                },
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                children: {
                  SegmentType.news: Text(
                    'Flight',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SegmentType.map: Text(
                    'News',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SegmentType.paper: Text(
                    'Map',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                },
                innerPadding: 0,
                backgroundColor: Colors.black,
                thumbDecoration: BoxDecoration(color: Colors.blue),
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInToLinear,
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
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
        title: Text('Second View'),
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
                children: {
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
                radius: 8,
                onValueChanged: (v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                initialValue: SegmentType.map,
                children: {
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
                innerPadding: 2,
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.black,
                thumbDecoration: BoxDecoration(color: Colors.blue),
                duration: Duration(milliseconds: 300),
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

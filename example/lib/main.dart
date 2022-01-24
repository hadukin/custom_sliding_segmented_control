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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
                elevation: 2,
                initialValue: SegmentType.map,
                isStretch: true,
                children: {
                  SegmentType.news: Text(
                    'Новости',
                    textAlign: TextAlign.center,
                  ),
                  SegmentType.map: Text(
                    'Карты',
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
                    'Новостной портал',
                    style: TextStyle(color: Colors.white),
                  ),
                  SegmentType.map: Text(
                    'Карты',
                    style: TextStyle(color: Colors.white),
                  ),
                  SegmentType.paper: Text(
                    'Список',
                    style: TextStyle(color: Colors.white),
                  ),
                },
                elevation: 0,
                innerPadding: 2,
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.black,
                thumbColor: Colors.blue,
                // textColor: Colors.white,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInToLinear,
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                elevation: 2,
                children: {
                  SegmentType.news:
                      Text('Новости', textAlign: TextAlign.center),
                  SegmentType.map: Text('Карты', textAlign: TextAlign.center),
                  SegmentType.paper:
                      Text('Список', textAlign: TextAlign.center),
                },
                radius: 8,
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
                elevation: 2,
                children: {
                  SegmentType.news:
                      Text('Новости', textAlign: TextAlign.center),
                  SegmentType.map: Text('Карты', textAlign: TextAlign.center),
                  SegmentType.paper:
                      Text('Список', textAlign: TextAlign.center),
                },
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<int>(
                children: {
                  0: Text('Новости', textAlign: TextAlign.center),
                  1: Text('Карты', textAlign: TextAlign.center),
                  2: Text('Список', textAlign: TextAlign.center),
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
                  SegmentType.news:
                      Text('Новости', textAlign: TextAlign.center),
                  SegmentType.map: Text('1', textAlign: TextAlign.center),
                  SegmentType.paper: Text('2', textAlign: TextAlign.center),
                },
                radius: 5,
                elevation: 8,
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<String>(
                children: {
                  'Новости': Text('Новости', textAlign: TextAlign.center),
                  'Карты': Text('Карты', textAlign: TextAlign.center),
                  'Список': Text('Список', textAlign: TextAlign.center),
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
                  SegmentType.news:
                      Text('Новости', textAlign: TextAlign.center),
                  SegmentType.map: Text('Карты', textAlign: TextAlign.center),
                  SegmentType.paper:
                      Text('Список', textAlign: TextAlign.center),
                },
                radius: 10,
                elevation: 8,
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                children: {
                  SegmentType.news:
                      Text('Новости', textAlign: TextAlign.center),
                  SegmentType.map: Text('Карты', textAlign: TextAlign.center),
                  SegmentType.paper:
                      Text('Список', textAlign: TextAlign.center),
                },
                elevation: 0,
                onValueChanged: (SegmentType v) {
                  print(v);
                },
              ),
              const SizedBox(height: 20),
              CustomSlidingSegmentedControl<SegmentType>(
                children: {
                  SegmentType.news: Text(
                    'Новости',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SegmentType.map: Text(
                    'Карты',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SegmentType.paper: Text(
                    'Список',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                },
                elevation: 0,
                innerPadding: 0,
                backgroundColor: Colors.black,
                thumbColor: Colors.blue,
                // textColor: Colors.white,
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
                elevation: 2,
                initialValue: SegmentType.paper,
                isStretch: true,
                children: {
                  SegmentType.news: Text(
                    'Новости',
                    textAlign: TextAlign.center,
                  ),
                  SegmentType.map: Text(
                    'Карты',
                    textAlign: TextAlign.center,
                  ),
                  SegmentType.paper: Text(
                    'Список',
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
                    'Новостной портал',
                    style: TextStyle(color: Colors.white),
                  ),
                  SegmentType.map: Text(
                    'Карты',
                    style: TextStyle(color: Colors.white),
                  ),
                  SegmentType.paper: Text(
                    'Список',
                    style: TextStyle(color: Colors.white),
                  ),
                },
                elevation: 0,
                innerPadding: 2,
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.black,
                thumbColor: Colors.blue,
                // textColor: Colors.white,
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

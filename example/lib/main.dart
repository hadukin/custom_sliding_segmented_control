import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

void main() {
  runApp(MyApp());
}

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
  MyHomePage({Key key}) : super(key: key);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomSlidingSegmentedControl(
              data: ['Новости', 'Карты', 'Список'],
              duration: Duration(milliseconds: 200),
              radius: 30.0,
              onTap: (index) {
                print(index);
              },
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl(
              fixedWidth: 100,
              data: ['Новости', '1', '2'],
              radius: 5,
              elevation: 8,
              onTap: (v) {
                print(v);
              },
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl(
              data: ['Новости', 'Карты', 'Список'],
              duration: Duration(milliseconds: 200),
              radius: 0.0,
              onTap: (v) {
                print(v);
              },
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl(
              innerPadding: 4,
              data: ['Новости', 'Карты', 'Список'],
              radius: 10,
              elevation: 8,
              onTap: (v) {
                print(v);
              },
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl(
              data: ['Новости', 'Карты', 'Список'],
              elevation: 0,
              onTap: (v) {
                print(v);
              },
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl(
              data: ['Новости', 'Карты', 'Список'],
              elevation: 0,
              innerPadding: 0,
              background: Colors.black,
              panelColor: Colors.blue,
              textColor: Colors.white,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInToLinear,
              onTap: (v) {
                print(v);
              },
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl(
              data: ['Новостной портал', 'Карты', 'Список'],
              elevation: 0,
              innerPadding: 2,
              padding: 16,
              background: Colors.black,
              panelColor: Colors.blue,
              textColor: Colors.white,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInToLinear,
              onTap: (v) {
                print(v);
              },
            ),
          ],
        ),
      ),
    );
  }
}

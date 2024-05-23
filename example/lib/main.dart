import 'package:example/example_1.dart';
import 'package:example/example_10.dart';
import 'package:example/example_11.dart';
import 'package:example/example_12.dart';
import 'package:example/example_13.dart';
import 'package:example/example_14.dart';
import 'package:example/example_15.dart';
import 'package:example/example_2.dart';
import 'package:example/example_3.dart';
import 'package:example/example_4.dart';
import 'package:example/example_5.dart';
import 'package:example/example_6.dart';
import 'package:example/example_7.dart';
import 'package:example/example_8.dart';
import 'package:example/example_9.dart';
import 'package:example/second_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examples'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Example15(),
            const SizedBox(height: 16),
            const Example14(),
            const SizedBox(height: 16),
            const Example12(),
            const SizedBox(height: 16),
            const Example3(),
            const SizedBox(height: 16),
            const Example1(),
            const SizedBox(height: 16),
            const Example2(),
            const SizedBox(height: 16),
            const Example4(),
            const SizedBox(height: 16),
            const Example5(),
            const SizedBox(height: 16),
            const Example6(),
            const SizedBox(height: 16),
            const Example7(),
            const SizedBox(height: 16),
            const Example8(),
            const SizedBox(height: 16),
            const Example9(),
            const SizedBox(height: 16),
            const Example10(),
            const SizedBox(height: 16),
            const Example11(),
            const SizedBox(height: 16),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Example13(),
            ),
            const SizedBox(height: 16),
            const Example13(),
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
          ],
        ),
      ),
    );
  }
}

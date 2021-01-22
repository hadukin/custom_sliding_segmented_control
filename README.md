# CustomSlidingSegmentedControl

![](https://raw.githubusercontent.com/hadukin/custom_sliding_segmented_control/main/screenshot/screenshot_2.gif)

#### Example

```
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
              data: ['Новости', 'Карты', 'Список'],
              duration: Duration(milliseconds: 200),
              radius: 0.0,
              onTap: (v) {
                print(v);
              },
            ),
            const SizedBox(height: 20),
            CustomSlidingSegmentedControl(
              data: ['Новости', 'Карты', 'Список'],
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
```

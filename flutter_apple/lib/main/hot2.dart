import 'package:app/main/sample_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class hot2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  final List<Color> colorList = [
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.teal,
    Colors.deepPurpleAccent
  ];

// Text组件需要用SliverToBoxAdapter包裹，才能作为CustomScrollView的子组件
  Widget renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  /**
   * 头部视频控件
   */
  Widget getHotVideo() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.black,
        margin: EdgeInsets.only(left: 10, top: 4, right: 10),
        height: 232,
        child: Text('是淡粉色的'),
      ),
    );
  }

  /**
   * 视频推荐wiget
   */
  Widget getHotRecommend() {
    return SliverToBoxAdapter(
      child: Container(
          height: 80,
          child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return SampleListItem(direction: Axis.horizontal);
              },
              itemCount: 5,
              viewportFraction: 0.8,
              scale: 0.9,
              autoplay: false)),
    );
  }

  /**
   * 推荐广告banner功能
   */
  Widget getHotBanner() {
    return SliverToBoxAdapter(
      child: Container(
          height: 100,
          child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return SampleListItem(direction: Axis.horizontal);
              },
              itemCount: 5,
              viewportFraction: 0.8,
              scale: 0.9,
              autoplay: false)),
    );
  }

  /**
   * 今日焦点
   *
   */
  Widget getHotFocus() {
    return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return SampleListItem();
        }, childCount: 5),
        itemExtent: 100);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            getHotVideo(),
            getHotRecommend(),
            getHotBanner(),
            getHotFocus()
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

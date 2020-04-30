import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hot1.dart';
import 'hot2.dart';

class mainTab1 extends StatelessWidget {
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  PageController pageController;

  TabController tabController;

  Widget getTabBar() {
    var tabbar = new TabBar(
      controller: tabController,
      tabs: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: Text("推荐"),
              padding: EdgeInsets.only(top: 53.0),
              width: 80,
              alignment: Alignment.center,
            )
          ],
        ),
        Column(children: <Widget>[
          Container(
            child: Text("视频"),
            padding: EdgeInsets.only(top: 53.0),
            width: 80,
            alignment: Alignment.center,
          )
        ]),
      ],
      labelColor: new Color(0xFF000000),
      labelStyle: TextStyle(
        fontSize: 19,
      ),
      isScrollable: false,
      unselectedLabelColor: new Color(0xFF999999),
      indicatorColor: Colors.purple,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 1.0,
      indicatorPadding: EdgeInsets.only(left: 20.0, right: 20),
    );
    return tabbar;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child:
      DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              brightness: Brightness.light,
              title: Container(
                  height: 45,
                  alignment: Alignment.topCenter,
                  child: TabBar(
                    tabs: [
                      Tab(text: '推荐'),
                      Tab(text: '视频'),
                    ],
                    controller: tabController,
                    indicatorWeight: 2,
                    indicatorPadding: EdgeInsets.only(left: 10, right: 10),
                    labelPadding: EdgeInsets.symmetric(horizontal: 10),
                    isScrollable: true,
                    indicatorColor: Color(0xffF44335),
                    labelColor: Color(0xff000000),
                    labelStyle: TextStyle(
                      fontSize: 19,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelColor: Color(0xffAAAAAA),
                    unselectedLabelStyle:
                        TextStyle(fontSize: 17, color: Color(0xff999999)),
                    indicatorSize: TabBarIndicatorSize.label,
                  )),
              elevation: 0,
            ),
            body: TabBarView(
              children: [
                new hot1(),
                new hot2(),
              ],
              controller: tabController,
            ),
          ),
        ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }
}

import 'package:flutter/material.dart';

import 'main/mainTab1.dart';
import 'main/mainTab2.dart';
import 'main/mainTab3.dart';

class appMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
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
  PageController pageController;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: new PageView(
        children: [new mainTab1(), new mainTab2(), new mainTab3()],
        controller: pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: new Image.asset("images/main_tabbar_hot_up.png"),
              activeIcon: new Image.asset("images/main_tabbar_hot_down.png"),
              title: new Text("主页",
                  style: new TextStyle(
                      color: new Color(
                          _currentIndex == 0 ? 0xFF000000 : 0xFF747474),
                      fontSize: 10.0)),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: new Image.asset("images/main_tabbar_match_up.png"),
              activeIcon: new Image.asset("images/main_tabbar_match_down.png"),
              title: new Text("比赛",
                  style: new TextStyle(
                      color: new Color(
                          _currentIndex == 1 ? 0xFF000000 : 0xFF747474),
                      fontSize: 10.0)),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: new Image.asset("images/main_tabbar_my_up.png"),
              activeIcon: new Image.asset("images/main_tabbar_my_down.png"),
              title: new Text("我的",
                  style: new TextStyle(
                      color: new Color(
                          _currentIndex == 2 ? 0xFF000000 : 0xFF747474),
                      fontSize: 10.0)),
              backgroundColor: Colors.white)
        ],
        onTap: onTap,
        currentIndex: _currentIndex,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = new PageController(initialPage: this._currentIndex);
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    setState(() {
      this._currentIndex = index;
    });
  }
}

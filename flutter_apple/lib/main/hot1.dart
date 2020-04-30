import 'package:flutter/material.dart';

class hot1 extends StatelessWidget {
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
  Container conVideView;
  Container conHotHead1View;
  Container conHotHead2View;

  int _hot2Title = 0;

  @override
  // TODO: implement widget
  MyHomePage get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: false,
      padding: EdgeInsets.all(0.0),
      physics: BouncingScrollPhysics(),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 210,
            ),
            Container(
              color: Colors.black,
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 35,
            ),
            Container(
              color: Colors.black,
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 32,
              child: Text(
                "$_hot2Title",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Raleway',
                    decoration: TextDecoration.underline,
                    inherit: false,
                    //2.不继承默认样式
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
            ),
            Stack(
              children: <Widget>[
                //可以通过alignment属性，设置其子widget与其对齐方式，默认center；
                //所以下面我们分别给注册和登录设置了居左和居右
                InkWell(
                    child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  // width: BoxFit.fitWidth,
                  height: 32,
                  color: Color(0xff141414),
//                  child: Image.asset(
//                    'images/login_background.png',
//                    fit: BoxFit.fill,
//                  ),
                )),
                Align(
                  alignment: Alignment.center,
                  widthFactor: 75,
                  heightFactor: 35,
                  child: Container(
                    color: Colors.black,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 35,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "忘记密码",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              ],
            ),
            FloatingActionButton(
              onPressed: getTodayFilm,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }

  void getTodayFilm() {
    //这是一个异步操作，结果返回有一定延迟
    //调用setState方法会通知framework控件状态有变化，它会立马触发
    //State的build方法更新widget状态
    setState(() {
      _hot2Title++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}

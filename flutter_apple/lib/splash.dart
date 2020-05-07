import 'dart:async';
import 'dart:convert';
import 'package:app/appMain.dart';
import 'package:app/generated/json/base/json_convert_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:ui'; //获取屏幕尺寸需要导入的包
import 'dart:io';
import 'package:flutter/services.dart';
import 'common/http/WanAndroidApi.dart';
import 'common/model/splash_entity_entity.dart';

void main() {
  runApp(MyApp());
//  if (Platform.isAndroid) {
//// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
//    SystemUiOverlayStyle systemUiOverlayStyle =
//        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MaterialApp(home: new MyHomePage()),
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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;
  bool isClicking1 = false;
  double statebar_height;

  //屏幕的宽高
  double height;
  double width;
  int pageViewIndex = 0;

  int pageTotalSize = 0;
  int countTime = 4;

  AppLifecycleState appLifecycleState;

  void upDataButtonState(bool clicked) {
    setState(() {
      isClicking1 = clicked;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return appMain();
          },
        ),
        (Route<dynamic> route) => false,
      );
    });
  }

  var splashBuilder;

  Future<SplashEntityEntity> fetchPost() async {
    var dio = Dio();
    Response response;
    response = await dio
        .get(WanAndroidApi.OtherCategory, queryParameters: {"type": 1});
//    print(JsonConvert.fromJsonAsT<SplashEntityEntity>(response.data)
//        .result
//        .elementAt(0)
//        .album10001000);
    return JsonConvert.fromJsonAsT<SplashEntityEntity>(response.data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashBuilder = fetchPost();
    initCountDown();
    WidgetsBinding.instance.addObserver(this);
  }

  String nextStr = "4s跳过";

  initCountDown() {
    // 只在倒计时结束时回调
    Timer.periodic(new Duration(seconds: 1), (timer) {
      if (timer.tick == 5) {
        setState(() {
          nextStr = '跳过';
        });
        timer.cancel();
        print(nextStr);
      } else {
        setState(() {
          nextStr = '${countTime--}s跳过';
        });
        print(nextStr);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    statebar_height = MediaQuery.of(context).padding.top;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print("屏幕原始===" + MediaQuery.of(context).devicePixelRatio.toString());
    return Scaffold(
        body: new Stack(
      children: <Widget>[
        new Positioned(
          child: FutureBuilder<SplashEntityEntity>(
            future: splashBuilder,
            builder: (BuildContext content, AsyncSnapshot async) {
              if (async.connectionState == ConnectionState.done) {
                print("success");
                return getPageView(async.data);
              } else {
                print("loading===");
                return Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                );
                return CircularProgressIndicator(strokeWidth: 1);
              }
            },
          ),
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
        ),
        new Positioned(
            child: Listener(
                child: new Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 2, right: 10, bottom: 2),
                  decoration: new ShapeDecoration(
                      color: !isClicking1 ? Colors.white : Color(0xff898989),
                      shape: StadiumBorder(
                          side: BorderSide(
                              color: Color(0xff898989),
                              style: BorderStyle.solid,
                              width: 1))),
                  child: Text(nextStr),
                ),
                onPointerDown: (event) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return appMain();
                      },
                    ),
                    (Route<dynamic> route) => false,
                  );
                }),
            top: 10 + statebar_height,
            right: 10),
        new Positioned(
            child: Listener(
              child: Container(
                child: Align(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset('images/splash_confirm.png'),
                      Text(
                        "立即开启",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Raleway',
                            //2.不继承默认样式
                            decorationStyle: TextDecorationStyle.dashed),
                      )
                    ],
                  ),
                  alignment: Alignment.bottomCenter,
                ),
                margin: EdgeInsets.only(bottom: 100),
              ),
              onPointerDown: (event) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return appMain();
                    },
                  ),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            height: pageTotalSize > 0 && (pageViewIndex == pageTotalSize - 1)
                ? height
                : 0,
            width: width)
      ],
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    setState(() {
      appLifecycleState = state;
    });
  }

  PageView getPageView(SplashEntityEntity splashEntityEntity) {
    PageView pageView;
    PageController pageController;
    pageTotalSize = splashEntityEntity.result.length;
    pageController = new PageController();
    print("ddd=" + splashEntityEntity.result.length.toString());
    pageView = new PageView.builder(
        itemBuilder: (context, index) {
          return new ConstrainedBox(
              child: new Image(
                  image: new NetworkImage(
                      splashEntityEntity.result.elementAt(index).album10001000),
                  fit: BoxFit.fill),
              constraints: new BoxConstraints.expand());
        },
        itemCount: splashEntityEntity.result.length,
        scrollDirection: Axis.horizontal,
        reverse: false,
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            pageViewIndex = index;
          });
          print('点击滚动到的位置' +
              pageViewIndex.toString() +
              "===" +
              pageTotalSize.toString());
        },
        physics: PageScrollPhysics(parent: BouncingScrollPhysics()));
    return pageView;
  }
}

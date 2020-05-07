import 'package:app/main/sample_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  @override
  // TODO: implement widget
  MyHomePage get widget => super.widget;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = Text("加载中");
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多!");
            } else {
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: CustomScrollView(
          slivers: <Widget>[
            getHotVideo(),
            getHotRecommend(),
            getHotBanner(),
            getHotFocus()
          ],
        ),

//        ListView.builder(
//          itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
//          itemExtent: 100.0,
//          itemCount: items.length,
//        ),
      ),
    );
  }

  int _count = 20;

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
          height: 85,
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
          height: 96,
          padding: EdgeInsets.only(top: 8, bottom: 8),
          color: new Color(0xFFFAF9F9),
          child: Swiper(
              pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )),
              //   control: new SwiperControl(),
              itemBuilder: (BuildContext context, int index) {
                return Image(
                    image: new NetworkImage(
                        "http://qukufile2.qianqian.com/data2/pic/8b1aab6be81f10639c01c1401a20463c/675021896/675021896.jpg"),
                    fit: BoxFit.fill);
              },
              itemCount: 5,
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
        itemExtent: 75);
  }

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}

//            EasyRefresh.builder(
//      builder: (context, ScrollPhysics physics, header, footer) {
//        return CustomScrollView(
//          physics: physics,
//          slivers: <Widget>[header, getHotWidget(), footer],
//        );
//      },
//      onLoad: () async {
//        await Future.delayed(Duration(seconds: 2), () {
//          if (mounted) {
//            setState(() {});
//          }
//        });
//      },
//      onRefresh: () async {},

/**
 * //        child: Column(
    //          children: <Widget>[
    //            Container(
    //              color: Colors.black,
    //              margin: EdgeInsets.only(left: 20, right: 10),
    //              height: 210,
    //            ),
    //            Container(
    //              color: Colors.black,
    //              margin: EdgeInsets.only(left: 10, right: 10),
    //              height: 35,
    //            ),
    //            Container(
    //              color: Colors.black,
    //              margin: EdgeInsets.only(left: 10, right: 10),
    //              height: 32,
    //              child: Text(
    //                "$_hot2Title",
    //                style: TextStyle(
    //                    color: Colors.white,
    //                    fontSize: 12,
    //                    fontFamily: 'Raleway',
    //                    decoration: TextDecoration.underline,
    //                    inherit: false,
    //                    //2.不继承默认样式
    //                    decorationStyle: TextDecorationStyle.dashed),
    //              ),
    //              padding: EdgeInsets.only(left: 10),
    //              alignment: Alignment.centerLeft,
    //            ),
    //            Stack(
    //              children: <Widget>[
    //                //可以通过alignment属性，设置其子widget与其对齐方式，默认center；
    //                //所以下面我们分别给注册和登录设置了居左和居右
    //                InkWell(
    //                    child: Container(
    //                  margin: EdgeInsets.only(left: 10, right: 10),
    //                  // width: BoxFit.fitWidth,
    //                  height: 32,
    //                  color: Color(0xff141414),
    ////                  child: Image.asset(
    ////                    'images/login_background.png',
    ////                    fit: BoxFit.fill,
    ////                  ),
    //                )),
    //                Align(
    //                  alignment: Alignment.center,
    //                  widthFactor: 75,
    //                  heightFactor: 35,
    //                  child: Container(
    //                    color: Colors.black,
    //                    margin: EdgeInsets.only(left: 10, right: 10),
    //                    height: 35,
    //                  ),
    //                ),
    //                Align(
    //                  alignment: Alignment.centerRight,
    //                  child: Text(
    //                    "忘记密码",
    //                    style: TextStyle(color: Colors.red, fontSize: 20),
    //                  ),
    //                ),
    //              ],
    //            ),
    //            FloatingActionButton(
    //              onPressed: getTodayFilm,
    //              tooltip: 'Increment',
    //              child: Icon(Icons.add),
    //            )
    //          ],
 **/

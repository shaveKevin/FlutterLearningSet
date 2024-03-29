import 'package:flutter/material.dart';
import 'feature/MainListView.dart';
import 'DevFunc/LifeCycle.dart';
import 'DevFunc/LifeCycleDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => new _MyApp();
}

class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  // 初始化三个tabbar
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  // 释放
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 启动的appdelegte
    return renderTabBarOne(controller, context);
  }
}

//  tabbar 第一种渲染方式通过TabBarView
Widget renderTabBarOne(TabController controller, BuildContext context) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: renderHome(controller),
    debugShowCheckedModeBanner: false,
  );
}
// 渲染在顶部的appbar
Widget renderTabTwo(TabController vc) {
  return Scaffold(
    appBar: renderAppBar(vc),
    body: renderTabbarView(vc),
  );
}
Widget renderAppBar(TabController vc) {
  return new AppBar(
    bottom: TabBar(
      // 这个属性是控制tabbar分布的位置  如果为true 则位置不平均分配
      isScrollable: false,
      controller: vc,
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.black26,
      tabs: <Widget>[
        new Tab(
          text: "首页",
          icon: new Icon(Icons.home),
        ),
        new Tab(
          text: "发现",
          icon: new Icon(Icons.find_in_page),
        ),
        new Tab(
          text: "我的",
          icon: new Icon(Icons.spa),
        ),
      ],
    ),
  );
}

Widget renderTabbarView(TabController vc) {
  return TabBarView(
    // 不让tabbar内容滚动
    physics: new NeverScrollableScrollPhysics(),
    controller: vc,
    children: <Widget>[
      ManiListViewDemo(
        title: 'Flutter 学习',
      ),
      LifeCyclePage(
        title: '声明周期',
      ),
      LifeCycleDetailPage(
        title: '生命周期学习',
      )
    ],
  );
}

// renderTabbar
Widget renderHome(TabController vc) {
  return new Scaffold(
    body: TabBarView(
      // 不让tabbar内容滚动
      physics: new NeverScrollableScrollPhysics(),
      controller: vc,
      children: <Widget>[
        ManiListViewDemo(
          title: 'Flutter 学习',
        ),
         LifeCyclePage(
        title: '声明周期',
      ),
      LifeCycleDetailPage(
        title: '生命周期学习',
      )
      ],
    ),
    bottomNavigationBar: renderBottomNavigationBar(vc),
  );
}

Widget renderBottomNavigationBar(TabController vc) {
  return new Material(
    color: Colors.white,
    child: new TabBar(
      // 这个属性是控制tabbar分布的位置  如果为true 这位置不平均分配
      isScrollable: false,
      controller: vc,
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.black26,
      tabs: <Widget>[
        new Tab(
          text: "首页",
          icon: new Icon(Icons.home),
        ),
        new Tab(
          text: "发现",
          icon: new Icon(Icons.find_in_page),
        ),
        new Tab(
          text: "我的",
          icon: new Icon(Icons.spa),
        ),
      ],
    ),
  );
}

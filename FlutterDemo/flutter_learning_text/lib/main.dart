import 'package:flutter/material.dart';
import 'feature/MainListView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 启动的appdelegte
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: ManiListViewDemo(title: 'Flutter 学习',),
        debugShowCheckedModeBanner: false,
    );
  }
}

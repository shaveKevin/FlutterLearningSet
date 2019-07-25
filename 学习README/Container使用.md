## Container使用
```
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '调皮捣蛋'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: childContainer(),
    );
  }

  Widget childContainer() {
    return Center(
        child: Column(
      children: <Widget>[
        Text('哈哈哈',
        textAlign: TextAlign.left),
        containerWidget(),
      ],
    ));
  }

  Widget containerWidget() {
    return Container(
      // 设置conainer 约束 主要设置宽和高（不设置的话 默认撑满整个界面）
      constraints: new BoxConstraints.expand(
        height: 200.0,
        width: 300.0,
      ),
      decoration: new BoxDecoration(
        // 这里是对container做圆角
        border: new Border.all(width: 1.0, color: Colors.red),
        color: Colors.grey,
        // 设置圆角
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        image: new DecorationImage(
          image: new NetworkImage(
              'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
          centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
        ),
      ),
      // 设置image在container中的位置 设置图形的偏移量
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      alignment: Alignment.topLeft,
      // child: new Text('jeck',
      // style:Theme.of(context).textTheme.display1.copyWith(color:Colors.black)
      // ),
      // transform: new Matrix4.rotationZ(0.3),
    );
  }
}
```
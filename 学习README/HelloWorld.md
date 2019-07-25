
## 第一次运行app说明
```
import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  // widget 子类中的字段往往都会被定义为final
@override
final Widget title;
Widget build (BuildContext context) {
  return new Container(
    height: 88.0,// 单位是逻辑上的像素，类似于浏览器中的像素 就是开发中写的物理像素
    padding: const EdgeInsets.symmetric(vertical:20.0,horizontal:8.0),
    decoration: new BoxDecoration(color: Colors.blue[500]),
    // row是水平方向的线性布局（linear layout）
    child: new Row(
      //列表的类型是widget
      children: <Widget>[
        new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: "navigation menu",
          onPressed: null,// null会禁用button
        ),
        new Expanded(
          child: title,
        ),
        new IconButton(
          icon: new Icon(Icons.search),
          tooltip: "search",
          onPressed: null,
        ),
      ],
    ),

  );
}
}
class MyScaffold extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    // Material 是UI呈现的一张纸 也就是VC的view
    // 布局
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title:new Text(
              'Example title',
              style:Theme.of(context).primaryTextTheme.title,
            ),
          ),
            new Expanded(
              child: new Center(
                child: new Text('hello, flutter'),
              ),
            ),
        ],
      ),

    );
  }
}
void main(){
  runApp(new MaterialApp(
    title: 'flutter',
    home: new MyScaffold(),
  ));
}
```
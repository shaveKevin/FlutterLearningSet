# 初识flutter
```
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
// 这个是封装的一个navigationbarbar
class MyAppBar extends StatelessWidget {
  // This widget is the root of your application.
  // 类似于类的声明
  // 初始化这个变量
  MyAppBar({this.title});
  // 注意widget子类中的字段往往都会定义为final
  final Widget title;

  @override
// 类的实现
  Widget build(BuildContext context) {
    return new Container(
      height: 84.0, // 单位是逻辑上的像素(并非真实的像素，类似于浏览器中的像素)
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: new BoxDecoration(color: Colors.orange[500]),
      // 内容的对齐力度
      alignment: Alignment(0.5, 0.5),
// row 是水平方向上的线性布局(linar layout)
      child: new Row(
        // 列表项的类型是<widget>
        children: <Widget>[
          // 这里里面有一个button  一个titleLabel 一个buttton
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'navigation menu',
            // 注意 这个null会禁用button  这里处理的是点击事件
            onPressed: null,
          ),
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.settings),
            tooltip: 'settings',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // material 是UI呈现的一张纸
    return new Material(
// column 是垂直方向的线性布局  column 包含 Expanded
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example 1111title',
             // style: Theme.of(context).accentTextTheme.title,   
             style: TextStyle(
               color: Colors.red,
               fontSize: 30,            
             ),    
             textAlign: TextAlign.center, 
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('hello flutter',
              style: TextStyle(
                color: Colors.red,
                fontSize: 40,
              ),

              )
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'my app',
    debugShowCheckedModeBanner: false,
    home: new MyScaffold(),
  ));
}

```
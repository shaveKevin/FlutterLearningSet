# Material使用
```
import 'dart:developer';

import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
void main() {
  //  带有navigati bar的(为了继承主题数据)
  runApp(new MaterialApp(
    title: 'flutter TutorialHome ',
    home: new TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold 是Material中主要的布局组件
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: new Center(
        child: new Text('hello flutter'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

// 处理手势
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('this button is clicked');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal:8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Engage'),
        ),

      ),
    );
  }
}
//在flutter中，事件流是向上传递的，而状态流是向下传递的(这类似于React/Vue中父子组卷通信的方式：
//子widget到父widget是通过事件通信，而父到子是通过状态，)重定向这一流程的共同父元素是State。
/*
class Counter extends  StatefulWidget {
  @override 
  _CounterState createState() => new _CounterState();
}
class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment(){
    setState(() {
      _counter++;
    });
  }
  // Widget是临时对象，用于构建当前状态下的应用程序而state对象在多次调用build()之间保持不变，允许它们记住信息(状态)
  @override 
  Widget build (BuildContext context) {
    // 当状态发生改变的的时候 会调用
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child:  new Text('Increment'),
        ),
        new Text('Count: $_counter'),
      ],
    );
  }

}
class CounterDisplay extends StatelessWidget {
CounterDisplay({this.count});
final int count;
@override 
Widget build (BuildContext context) {
  return new Text('Count:$count');
}
}


class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});
  final VoidCallback  onPressed;
  @override 
  Widegt build (BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('Increment'),
    );
  }
}
class Counter extends StatefulWidget {
  @override 
  _CounterState createState () => new _CounterState();

}
class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment () {
    setState(() {
      ++_counter;
    });
  }

  @override 
  Widget build (BuildContext context) {
    return new Row(children: <Widget>[
new CounterIncrementor(onPressed:_increment),
new CounterDisplay(count:_counter),
    ],
    );
  }
}
*/
// 注意我们是如何创建了两个新的无状态的widget我们清晰地分离了显示计数器（CounterDisplay）和更改计数器
// CounterIncrementor上的逻辑。尽管最终效果与前一个实例相同，但责任分离云溪将复杂的逻辑封装在各个Widget中，同时保持父项的简单性。
```
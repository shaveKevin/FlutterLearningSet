import 'package:flutter/material.dart';

class ListDynamicViewDemo extends StatefulWidget {

  final String title;
  final List<String> items;
  // 初始化方法 构造法方法  super一下
  ListDynamicViewDemo({Key key,this.items, @required this.title}):super(key:key);
  @override
  _ListDynamicViewDemoState createState() => _ListDynamicViewDemoState();
}

class _ListDynamicViewDemoState extends State<ListDynamicViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: renderDynamicView(context,widget.items),
    );
  }
}

Widget renderDynamicView (BuildContext context,List items){
return new ListView.builder(
  itemCount: items.length,
  itemBuilder:(context,index){
    return new ListTile(
      title: new Text('${items[index]}'),
    );
  }
);
}




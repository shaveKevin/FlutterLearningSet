import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  ListViewDemo({this.title});
  final String title;
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MyList(),
    );
  }
}
class MyList extends StatelessWidget {
  Widget build(BuildContext context) {
    return renderCenter();
  }
}
// 居中的
Widget renderCenter() {
  return Center(
    child: Container(
      height: 200,
      child: renderListScroll(),
    ),
  );
}
// 渲染横向滚动的listview  
Widget renderListScroll() {
  return new ListView(
    // 滚动方向
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      renderCellItem(Colors.black),
      renderCellItem(Colors.blue),
      renderCellItem(Colors.green),
      renderCellItem(Colors.red),
      renderCellItem(Colors.redAccent),
      renderCellItem(Colors.green),
      renderCellItem(Colors.greenAccent),
      renderCellItem(Colors.lightBlue),
      renderCellItem(Colors.lightGreen),
      renderCellItem(Colors.lightBlueAccent),
    ],
  );
}

Widget renderCellItem(Color color) {
  return new Container(
    width: 180,
    color: color,
  );
}
// 渲染带有图片的Item
Widget renderListView() {
  return new ListView(
    children: <Widget>[
      Image.network('http://seopic.699pic.com/photo/50035/0520.jpg_wh1200.jpg'),
      Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI1_tU7Ndu0PivfA825WTHAtTcNvO2DzTsZEA5tTuVOsg79LqB'),
      Image.network(
          'https://p.ssl.qhimg.com/dmfd/400_300_/t0120b2f23b554b8402.jpg'),
      Image.network(
          'http://pics.sc.chinaz.com/files/pic/pic9/201904/zzpic17483.jpg'),
      Image.network('http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg'),
    ],
  );
}
// 渲染文本的
Widget renderListViewTile() {
  return new ListView(
    children: <Widget>[
      new ListTile(
        leading: new Icon(Icons.border_right),
        title: Text('哈哈哈哈啊'),
      ),
      new ListTile(
        leading: new Icon(Icons.bookmark),
        title: Text('bookmark'),
      ),
      new ListTile(
        leading: new Icon(Icons.android),
        title: Text('android'),
      )
    ],
  );
}



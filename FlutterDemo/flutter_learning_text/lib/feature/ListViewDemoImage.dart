import 'package:flutter/material.dart';

class ListViewDemoImage extends StatefulWidget {
    ListViewDemoImage({this.title});
  final String title;
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemoImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:renderListView(),
    );
  }
  Widget renderListView(){
    return new ListView(
      children: <Widget>[
        renderImageOne('http://pic1.win4000.com/mobile/2019-04-11/5caee308b8f29.jpg'),
        renderImageOne('http://pic1.win4000.com/mobile/2018-08-01/5b6167f04f828.jpg'),        
        renderImageOne('http://pic1.win4000.com/mobile/f/5615da3058d12.jpg'),
      ],
    );
  }
  Widget renderImageOne(String urlString) {
  return new Container(
    // width: 200,
    height: 300,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: new NetworkImage(urlString),
        //注意这里一定要设置填充模式。否则得到的图片不一定是圆角
        fit: BoxFit.cover,
      ),
      // 可控制圆角大小。(和shape 冲突)
      // borderRadius: BorderRadius.all(Radius.circular(100)),
      // 设置圆角是 纯圆形 适合头像
     // shape: BoxShape.circle,
    ),
    margin: EdgeInsets.all(10),
  );
}
}

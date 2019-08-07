import 'package:flutter/material.dart';

String imageUrl = "http://pic1.win4000.com/pic/d/cb/54616ea9a1.jpg";

//  圆角的dart
class CirleWidgetPage extends StatefulWidget {
  CirleWidgetPage({this.title});
  final String title;
  @override
  _CirleWidgetPageState createState() => _CirleWidgetPageState();
}

class _CirleWidgetPageState extends State<CirleWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: renderAll(),
    );
  }
}

Widget renderAll() {
  return new Column(
    children: <Widget>[
      renderScrollviewBody(),
    ],
  );
}

// 渲染scrollview
Widget renderScrollviewBody() {
  return new CustomScrollView(
    shrinkWrap: true,
    slivers: <Widget>[
      new SliverPadding(
        padding: const EdgeInsets.all(10.0),
        sliver: new SliverList(
            delegate: new SliverChildListDelegate(
          <Widget>[
            new Center(child: renderImageOne()),
            new Center(child: renderImageTwo()),
            new Center(child: renderImageThree()),
            new Center(child: renderImageFour()),
          ],
        )),
      )
    ],
  );
}

Widget renderBody() {
  return renderImageOne();
}

// 圆角实现方式一 采用的是 container中的BoxDecoration 组件 采用borderRadius 或者shape来设置
Widget renderImageOne() {
  return new Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: new NetworkImage(imageUrl),
        //注意这里一定要设置填充模式。否则得到的图片不一定是圆角
        fit: BoxFit.cover,
      ),
      // 可控制圆角大小。(和shape 冲突)
      // borderRadius: BorderRadius.all(Radius.circular(100)),
      // 设置圆角是 纯圆形 适合头像
      shape: BoxShape.circle,
    ),
    margin: EdgeInsets.all(10),
  );
}

//  圆角实现方式一 ClipOval 控件使用
Widget renderImageTwo() {
  return new ClipOval(
      child: SizedBox(
    width: 200,
    height: 200,
    child: Image.network(imageUrl, fit: BoxFit.cover),
  ));
}

//  椭圆
Widget renderImageThree() {
  return new ClipOval(
      child: SizedBox(
    width: 200,
    height: 100,
    child: Image.network(imageUrl, fit: BoxFit.cover),
  ));
}

// 圆角 使用ClipRRect widget
Widget renderImageFour() {
  return new Container(
    child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          imageUrl,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        )),
  );
}

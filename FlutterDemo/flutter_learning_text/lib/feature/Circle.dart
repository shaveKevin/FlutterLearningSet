import 'package:flutter/material.dart';

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
      body: Column(
        children: <Widget>[
          new Center(child: renderImageOne()),
          new Center(child: renderImageTwo()),
          new Center(child: renderImageThree()),
        ],
      ),
    );
  }
}

// 圆角实现方式一 采用的是 container中的BoxDecoration 组件 采用borderRadius 或者shape来设置
Widget renderImageOne() {
  return new Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: new NetworkImage(
            'http://pic1.win4000.com/pic/9/ae/8a14352845_250_350.jpg'),
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
    child: Image.network(
        'http://pic1.win4000.com/pic/9/ae/8a14352845_250_350.jpg',
        fit: BoxFit.cover
        ),
  )
  );
}

//  椭圆
Widget renderImageThree() {
  return new ClipOval(
      child: SizedBox(
    width: 200,
    height: 100,
    child: Image.network(
        'http://pic1.win4000.com/pic/9/ae/8a14352845_250_350.jpg',
        fit: BoxFit.cover
        ),
  )
  );
}

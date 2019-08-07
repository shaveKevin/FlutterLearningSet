import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  MyHomePage({this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: renderScrollviewBody(),
    );
  }

  Widget renderColumn() {
    return new Column(
      children: <Widget>[
        renderImage(),
        renderCenter(),
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
              renderImage(),
              renderCenter(),
              renderStackView(),
            ],
          )),
        )
      ],
    );
  }

  Widget renderImage() {
    return Center(
      child: GestureDetector(
        onTap: () {
          print('点击了图片');
          showAlert();
        },
        child: Container(
          child: Image.network(
            'http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg',
            // 图片的缩放比
            scale: 2.0,
            // 图片填充模式
            fit: BoxFit.cover,
            // 图片颜色
            // color: Colors.greenAccent,
            // 混合模式
            // colorBlendMode: BlendMode.darken,
            // 图片重复 在某方向上
            repeat: ImageRepeat.noRepeat,
          ),
          width: 400,
          height: 200,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          //container背景色  和BoxDecoration冲突
          // color: Colors.lightBlue,
          //  container中元素内边距
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            // 设置边框 container的边框
            border: Border.all(width: 1, color: Colors.red),
            // 背景色 container
            color: Colors.grey,
            //这里只能对container 做圆角处理 并不能对image做圆角
            borderRadius: new BorderRadius.all(new Radius.circular(2)),
          ),
        ),
      ),
    );
  }

// 渲染center
  Widget renderCenter() {
    return Center(
      child: renderContainer(),
    );
  }

// 渲染container
  Widget renderContainer() {
    return Container(
      child: renderText(),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(5),
      width: 500,
      // height: 400,
      // color: Colors.lightBlue,
      margin: EdgeInsets.all(10),
      // 注意。。 这个和color 冲突(两者只能选一个)。。。。。。。
      decoration: new BoxDecoration(
          //设置渐变色
          gradient: const LinearGradient(
              colors: [Colors.blue, Colors.green, Colors.pink])),
    );
  }

  Widget renderText() {
    //渲染文本
    return Text(
      '在Flutter中非常常见的一个多子节点控件，将children排列成一行。估计是借鉴了Web中Flex布局，所以很多属性和表现，都跟其相似。但是注意一点，自身不带滚动属性，如果超出了一行，在debug下面则会显示溢出的提示。',
      textAlign: TextAlign.left,
      // 最大行数
      maxLines: 5,
      // 文本末尾显示处理(省略号 还是xxx)
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        // 字号
        fontSize: 20.0,
        // 字颜色
        color: Color.fromARGB(255, 255, 150, 150),
        //字下面加下划线
        decoration: TextDecoration.underline,
        // 背景色
        backgroundColor: Colors.yellow,
      ),
    );
  }
}

Widget renderStackView() {
  return new Container(
    height: 100,
    width: 100,
    color: Colors.yellow,
    child: Stack(
      children: <Widget>[
        new Positioned(
            left: 10.0,
            top: 30.0,
            child: Center(
              child: renderText(),
            )),
        new Container(
          height: 30,
          width: 100,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text('nonPositioned'),
        )
      ],
    ),
  );
}

Widget renderText() {
  return new Container(
    height: 30,
    width: 100,
    color: Colors.red,
    alignment: Alignment.center,
    child: Text('Positioned'),
  );
}

Widget showAlert() {
  return new AlertDialog(
    content: new SingleChildScrollView(
      child: ListBody(
        children: <Widget>[Text("是否要删除？"), Text("一旦删除数据不可恢复!")],
      ),
    ),
    actions: <Widget>[
      FlatButton(
        child: Text('确定'),
        onPressed: () {
          print("点击了确定按钮");
        },
      ),
      FlatButton(
        child: Text('取消'),
        onPressed: () {
          print("点击了取消按钮");
        },
      )
    ],
  );
}

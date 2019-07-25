import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  final String title;
  GridViewPage({this.title});
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: renderGridViewTwo(),
    );
  }

  Widget renderGridViewOne() {
    return GridView.count(
      padding: const EdgeInsets.all(10.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 3,
      children: <Widget>[
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
      ],
    );
  }

  Widget renderGridViewTwo() {
    return GridView(
      // gridview 内边距
      padding: const EdgeInsets.all(2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 3行
          crossAxisCount: 2,
          // 主轴 下边边距
          mainAxisSpacing: 2.0,
          //右边间距
          crossAxisSpacing: 2.0,
          //宽高比
          childAspectRatio: 0.75),
      children: <Widget>[
        new Image.network('http://pic1.win4000.com/pic/8/68/41668ad460.jpg',
            fit: BoxFit.cover),
        new Image.network('http://pic1.win4000.com/pic/8/68/3aadc1fee4.jpg',
            fit: BoxFit.cover),
        new Image.network('http://pic1.win4000.com/pic/e/a1/2737e91cb3.jpg',
            fit: BoxFit.cover),
        new Image.network('http://pic1.win4000.com/pic/e/a1/6e52290d04.jpg',
            fit: BoxFit.cover),
        new Image.network('http://pic1.win4000.com/pic/f/90/e50d450203.jpg',
            fit: BoxFit.cover),
        new Image.network('http://pic1.win4000.com/pic/f/1a/314a395fe4.jpg',
            fit: BoxFit.cover),
        new Image.network('http://pic1.win4000.com/pic/8/72/51b0cf3e5e.jpg',
            fit: BoxFit.cover),
        new Image.network('http://pic1.win4000.com/pic/3/e3/aaeb4dbbc9.jpg',
            fit: BoxFit.cover),
        new Image.network('http://pic1.win4000.com/pic/8/4b/92593300ef.jpg',
            fit: BoxFit.cover),
        new Image.network('http://pic1.win4000.com/pic/7/8d/22a10558d2.jpg',
            fit: BoxFit.cover),
        new Image.network('http://pic1.win4000.com/pic/6/22/d3ce6f2d4b.jpg',
            fit: BoxFit.cover),
        new Image.network('http://pic1.win4000.com/pic/d/cb/b1354a5f41.jpg',
            fit: BoxFit.cover),
      ],
    );
  }
}

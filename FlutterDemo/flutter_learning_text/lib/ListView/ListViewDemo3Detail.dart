import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class DetailListDemo extends StatelessWidget {
  // 创建一个WordPair 类型的数组用来保存数据
  final List<WordPair> suggessions;
  // 定义一个类方法

  DetailListDemo({this.suggessions});
  @override
  Widget build(BuildContext context) {
    print(suggessions);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的收藏"),
      ),
      // 用tablview渲染body
      body: renderListView(this.suggessions),
    );
  }
}

Widget renderListView(List<WordPair> listArray) {
  if (listArray.length == 0) {
    return Center(
      child: new Text("暂无数据"),
    );
  }
  return new ListView.builder(
      itemCount: listArray.length,
      itemBuilder: (context, index) {
        // 拿到model
        WordPair pair = listArray[index];
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.left,
          ),
        );
      });
}

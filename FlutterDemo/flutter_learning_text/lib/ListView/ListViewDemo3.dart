import 'package:flutter/material.dart';
// 英文单词对(驼峰)
import 'package:english_words/english_words.dart';
// 头文件引用
import 'ListViewDemo3Detail.dart';

// 声明一个类
class RandomWords extends StatefulWidget {
  final String title;
  RandomWords({this.title});
  @override
  // 创建一个实现RandomWords 带有状态的类
  _RandomWordsState createState() => new _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  // 创建一个WordPair 类型的数组用来保存数据
  final _suggessions = <WordPair>[];
  // 创建一个变量用来保存大字体
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // 添加一个集合用来保存点赞状态  因为几何中能避免重复数据
  final _saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    List array = <WordPair>[];
    array.addAll(_saved);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.list),
              onPressed: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) =>
                        new DetailListDemo(suggessions: array),
                  )
                  )
                  ),
        ],
      ),
      body: _buildSuggessions(),
    );
  }

  Widget _buildSuggessions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(6),
        itemBuilder: (context, i) {
          // 在每一列之前增加一个1像素高的分割线Widget
          if (i.isOdd) {
            return new Divider();
          }
          // 向下去整
          final index = i ~/ 2;
          if (index >= _suggessions.length) {
            // 再生成10个单词对，添加到列表数组中
            _suggessions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggessions[index]);
        });
  }

// 这里就是写cell样式的地方了
  Widget _buildRow(WordPair pair) {
    // 检查确保单词对没有添加到收藏夹中
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        // 调用setState() 会为State对象触发build()方法
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

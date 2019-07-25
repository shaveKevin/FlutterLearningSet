import 'package:flutter/material.dart';

class ListViewDemo1Page extends StatefulWidget {
  final String title;
  ListViewDemo1Page({this.title});
  @override
  _ListViewDemo1PageState createState() => _ListViewDemo1PageState();
}

class _ListViewDemo1PageState extends State<ListViewDemo1Page> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: renderListView(),
    );
  }
  Widget renderListView() {
  final String horseUrl = 'https://i.stack.imgur.com/Dw6f7.png';
  final String cowUrl = 'https://i.stack.imgur.com/XPOr3.png';
  final String camelUrl = 'https://i.stack.imgur.com/YN0m7.png';
  final String sheepUrl = 'https://i.stack.imgur.com/wKzo8.png';
  final String goatUrl = 'https://i.stack.imgur.com/Qt4JP.png';
  return ListView(
    children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(horseUrl),
        ),
        title: Text('Horse'),
        subtitle: Text('A strong animal'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('tap  horse');
        },
        selected: true,
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(cowUrl),
        ),
        title: Text('Cow'),
        subtitle: Text('Provider of milk'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('tap  cow');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(camelUrl),
        ),
        title: Text('Camel'),
        subtitle: Text('Comes with humps'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('tap  Camel');
        },
        enabled: false,
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(sheepUrl),
        ),
        title: Text('Sheep'),
        subtitle: Text('Provider  wool'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('tap  Sheep');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(goatUrl),
        ),
        title: Text('Goat'),
        subtitle: Text('Some have horns'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('tap  Goat');
        },
      ),
    ],
  );
}
}


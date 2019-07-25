
## 基础Widget
Flutter有一套丰富的、强大的基础Widget，其中一下是很常用的：
* **Text**:该Widget可以创建一个带格式的文本。
* **Row**、**Column**：这些具有弹性空间的布局类Widget可让您在水平(Row)和垂直(Column)方向上创建灵活的布局其设计师基于web开发中的Flexbox布局模型。
* **Stack**取代线性布局(译者语：和安卓的LinearLayout相似)，**Stack**允许子widget堆叠，你可以使用**Positioned**来定位他们的相对`Stack`的上下左右四条边的位置。Stacks是给予web开发中的绝度定位(absolute positioning)布局模型设计的。
* **Container**:container可以让您创建矩形视觉元素。Container可以装饰为一个BoxDecoration，如background、一个边框、或者一个阴影。Container 也可以具有边距(margins)、填充(padding)和应用于其大小的约束(constraints)。另外，Container可以使用矩阵的三维空间对其进行变换。

复杂的widget都是由简单的widget组合而成。
```
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
  ));
}

```
请确保在pubspec.yaml文件中，将flutter的值设置为：uses-material-design:true。这允许我们可以使用一组预定义的Material icons。
```
name:my_app
flutter:
   uses-material-design:true
```
为了继承主题数据，widget需要位于MateralApp内才能正常显示。因此我们使用MaterialApp来运行该应用。
在MyAppBar中创建一个Container，高度为56像素(像素单位独立于设备，为逻辑像素)，其左侧和右侧均有8像素的填充。在容器内部，MyAppBar使用Row布局来排列其子项。中间的title widget被标记为Expanded，这意味着它为填充尚未其他子项占用的剩余可用空间。Expanded可以拥有多个Children，然后使用flex参数来确定他们占用剩余空间的比例。

MyScaffold是通过一个Column widget,在垂直方向排列其子项。在Column的顶部，放置了一个MyAppBar实例，将一个Text widget作为其标题传递给应用程序栏。将widget作为参数传递给其他widget是一种强大的技术，可以让您创建各种复杂的widget。最后，MyScaffold使用了一个Expanded来填充剩余的空间。正中间包含一条message。

## 使用 Material 组件

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'TextAndImage.dart';
import 'Circle.dart';
import 'ListView.dart';
import 'ListDynamicView.dart';
import 'ListViewDemoImage.dart';
import 'MainListModel.dart';
import 'GridView.dart';
import 'Photo.dart';

class ManiListViewDemo extends StatelessWidget {
  ManiListViewDemo({this.title});
  final String title;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: renderMainListView(context, renderModel()),
    );
  }

  Widget renderMainListView(BuildContext context, List items) {
    return new ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        MainListModel model = items[index];
        return new ListTile(
          title: Text(model.name),
          onTap: () {
            switch (model.type) {
              case MainListViewType.MyHomePage:
                {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new MyHomePage(title: model.name),
                      ));
                }
                break;
              case MainListViewType.Circle:
                {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) =>
                            new CirleWidgetPage(title: model.name),
                      ));
                }
                break;

              case MainListViewType.ListDynamic:
                {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new ListDynamicViewDemo(
                            items: new List<String>.generate(
                                1000, (i) => "items $i"),
                            title: model.name),
                      ));
                }
                break;
              case MainListViewType.ListView:
                {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) =>
                            new ListViewDemo(title: model.name),
                      ));
                }
                break;
              case MainListViewType.ListViewDemoImage:
                {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) =>
                            new ListViewDemoImage(title: model.name),
                      ));
                }
                break;
              case MainListViewType.GridViewPage:
                {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) =>
                            new GridViewPage(title: model.name),
                      ));
                }
                break;
                case MainListViewType.PhotoViewPage:
                {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) =>
                            new PhotoTestDemoPage(title: model.name),
                      ));
                }
                break;

              default:
                break;
            }
          },
        );
      },
    );
  }

  static List<MainListModel> renderModel() {
    List<MainListModel> list = new List();
    MainListModel model1 = new MainListModel();
    model1.name = "文本和图片组件";
    model1.type = MainListViewType.MyHomePage;

    MainListModel model2 = new MainListModel();
    model2.name = "图片圆角处理";
    model2.type = MainListViewType.Circle;

    MainListModel model3 = new MainListModel();
    model3.name = "ListView组件";
    model3.type = MainListViewType.ListView;

    MainListModel model4 = new MainListModel();
    model4.name = "ListDynamicView组件";
    model4.type = MainListViewType.ListDynamic;

    MainListModel model5 = new MainListModel();
    model5.name = "图片List组件";
    model5.type = MainListViewType.ListViewDemoImage;

    MainListModel model6 = new MainListModel();
    model6.name = "CollectionView组件";
    model6.type = MainListViewType.GridViewPage;

    MainListModel model7 = new MainListModel();
    model7.name = "颜值大师";
    model7.type = MainListViewType.PhotoViewPage;

    list.add(model1);
    list.add(model2);
    list.add(model3);
    list.add(model4);
    list.add(model5);
    list.add(model6);
    list.add(model7);

    return list;
  }
}

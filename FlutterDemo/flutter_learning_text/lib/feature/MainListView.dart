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
import 'package:flutter_learning_text/WebViewFlutter/WebViewFlutter.dart';
import 'package:flutter_learning_text/ListView/ListViewDemo1.dart';
import 'package:flutter_learning_text/ListView/ListViewDemo2.dart';
import 'package:flutter_learning_text/ListView/ListViewDemo3.dart';

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
              case MainListViewType.WebViewPage:
                {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new WebViewPage(
                            title: model.name, url: 'https://www.baidu.com/'),
                      ));
                }
                break;

              case MainListViewType.ListViewDemo1Page:
                {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) =>
                            new ListViewDemo1Page(title: model.name),
                      ));
                }
                break;
              case MainListViewType.ListViewDemo2Page:
                {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new ShoppingList(
                          products: <Product>[
                            new Product(name: 'Eggs'),
                            new Product(name: 'Flour'),
                            new Product(name: 'Chocolate chips'),
                          ],
                        ),
                      ));
                }
                break;
                 case MainListViewType.ListViewDemo3Page:
                {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) =>
                            new RandomWords(title: model.name),
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

    MainListModel model8 = new MainListModel();
    model8.name = "Webview";
    model8.type = MainListViewType.WebViewPage;

    MainListModel model9 = new MainListModel();
    model9.name = "简单列表";
    model9.type = MainListViewType.ListViewDemo1Page;

    MainListModel model10 = new MainListModel();
    model10.name = "购物车";
    model10.type = MainListViewType.ListViewDemo2Page;

    MainListModel model11 = new MainListModel();
    model11.name = "收藏列表";
    model11.type = MainListViewType.ListViewDemo3Page;

    list.add(model1);
    list.add(model2);
    list.add(model3);
    list.add(model4);
    list.add(model5);
    list.add(model6);
    list.add(model7);
    list.add(model8);
    list.add(model9);
    list.add(model10);
    list.add(model11);

    return list;
  }
}

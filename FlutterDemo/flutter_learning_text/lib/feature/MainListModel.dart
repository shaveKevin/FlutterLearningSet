/**
 * @description: 
 * @param {type} 
 * @return: 
 */
class MainListModel {
  String name;
  String title;
  MainListViewType type;
}
enum MainListViewType {
  // 圆角
  Circle,
  // 静态列表
  ListDynamic,
  // 列表
  ListView,
  // listview image
  ListViewDemoImage,
 // 主页 
  MyHomePage,
  // collectionview
  GridViewPage,
  // 颜值大师
  PhotoViewPage,
  // webview
  WebViewPage,
// 简单列表1
  ListViewDemo1Page,
  // 简单列表2
  ListViewDemo2Page,
  // 简单列表3
  ListViewDemo3Page,

}
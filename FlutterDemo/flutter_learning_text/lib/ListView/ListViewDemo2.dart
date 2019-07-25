import 'package:flutter/material.dart';
// 定义model
class Product {
  const Product({this.name});
  // 属性
  final String name;
}
// 定义block回调
typedef void CartChangedCallback(Product product,bool inCart);
//定义一个cell
class ShoppingListItem extends StatelessWidget {
  // 实例化需要的参数
  ShoppingListItem({Product product,this.inCart,this.onCartChanged})
  :product = product,
  super(key: new ObjectKey(product));
  // 属性
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;
  Color _getColor(BuildContext context) {
  return inCart ? Colors.black54 : Theme.of(context).primaryColor;
}
// textStyle 的样式
TextStyle _getTextStyle(BuildContext context) {
  if(!inCart) return null;
  return new TextStyle(
    color: Colors.black54,
    decoration:TextDecoration.lineThrough,
  );
}
@override 
// 实现ListTile 可以检测用户的点击和长按事件，点击后的波纹效果是内置的。
Widget build (BuildContext context) {
  return new ListTile(
    // 点击事件  可以通过enabled属性，来控制是否能够交互。
    onTap:(){
      onCartChanged(product,!inCart);
    },
    onLongPress: (){
      print('长按了item');
    },
    //enabled:false,
  // cell 样式  
  // 头像
    leading: new CircleAvatar(
      //背景颜色
      backgroundColor: _getColor(context),
      // 内容
       child: new Text(product.name[0]),
    ),
    // title
    title: new Text(product.name,style: _getTextStyle(context)),
  // 设置右边的箭头
    trailing: Icon(Icons.keyboard_arrow_right),
    //设置内容边距，默认是 16，但我们在这里设置为 0
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
    // subtitle 
    subtitle: new Text('点击就加入购物车了',style: _getTextStyle(context)),
    // 如果选中列表的 item 项，那么文本和图标的颜色将成为主题的主颜色。
    selected: true,

  );
}
}
// 承载的VC
class ShoppingList extends StatefulWidget {
  // 初始化
ShoppingList({Key key, this.products}): super(key:key);
//数组
final List<Product> products;
@override 
_ShoppingListState createState()=> new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList>{
  Set<Product> _shoppingCart = new Set<Product>();
  // state 会走好多次
  void _handleCartChanged(Product product, bool inCart){
    setState(() {
      if(inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }
  @override 
  Widget build (BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物车'),
      ),
      body:  new ListView(
        // 创建一个tableview
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product prodcut){
          return new ShoppingListItem(
            product:prodcut,
            inCart:_shoppingCart.contains(prodcut),
            onCartChanged:_handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'LifeCycleDetail.dart';

class LifeCyclePage extends StatefulWidget {
  final String title;
  LifeCyclePage({this.title});
  @override
  _LifeCyclePage createState() => _LifeCyclePage();
}

class _LifeCyclePage extends State<LifeCyclePage> with WidgetsBindingObserver {
  @override
  void initState() {
    print('_LifeCyclePage视图初始化====initState');
    super.initState();
    //注册应用声明周期监听
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  //这个函数会紧跟在initState之后调用，并且可以调用BuildContext.inheritFromWidgetOfExactType
  void didChangeDependencies() {
    print('===_LifeCyclePage==didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LifeCyclePage oldWidget) {
    print('_LifeCyclePage==didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('_LifeCyclePage=视图将要离开显示==deactivate');
    super.deactivate();
  }

  @override
// 销毁当前widget(类似于当前VC的dealloc)
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    print('_LifeCyclePage==销毁当前widget=dispose');
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        print('_LifeCyclePage===app 将要进入后台/或者前台 不接受交互');
        break;
      case AppLifecycleState.paused:
        print('_LifeCyclePage===app不接受交互 处于后台');
        break;
      case AppLifecycleState.resumed:
        print('_LifeCyclePage===app可见，可接受交互，从后台进入到前台的时候调用');
        break;
      case AppLifecycleState.suspending:
        print('_LifeCyclePage===应用被挂起 在iOS中目前没有使用到');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Scaffold(
        appBar: new AppBar(
          title: Text('哈哈哈哈'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.list),
              onPressed: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) =>
                        new LifeCycleDetailPage(title: "model.name"),
                  )),
            ),
          ],
        ),
        body: Text('我是内容你信不信'),
      ),
    );
  }
}

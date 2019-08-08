import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LifeCycleDetailPage extends StatefulWidget {
  final String title;
  int counter =
      0; // 之所以这个变量不在下面的方法里初始化 是因为这是一个tabbarvc 由于生命周期的原因。每次退出这个页面的时候数据会重置。
  LifeCycleDetailPage({this.title});
  @override
  _LifeCycleDetailPage createState() => _LifeCycleDetailPage();
}

class _LifeCycleDetailPage extends State<LifeCycleDetailPage>
    with WidgetsBindingObserver {
  void updateContent() {
    setState(() {
      widget.counter++;
    });
  }

  @override
  void initState() {
    print('初始化 类似于iOS 中的初始化方法 alloc init');
    //注册应用声明周期监听
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('====init 方法之后会调用 === didChangeDependencies');
    super.didChangeDependencies();
  }

/*
当你调用了 setState 将 Widget 的状态被改变时 didUpdateWidget 会被调用，
Flutter 会创建一个新的 Widget 来绑定这个 State，并在这个方法中传递旧的 Widget ，
因此如果你想比对新旧 Widget 并且对 State 做一些调整，你可以用它，
另外如果你的某些 Widget 上涉及到 controller 的变更，
要么一定要在这个回调方法中移除旧的 controller 并创建新的 controller 监听。
*/
  @override
  void didUpdateWidget(LifeCycleDetailPage oldWidget) {
    print('===屏幕发生旋转的时候也会调用=调用setState的时候回调用===didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('当前视图将要消失===deactivate=== 类似iOS中viewwilldisappear');
    super.deactivate();
  }

  @override
// 销毁当前widget(类似于当前vc的dealloc)
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    print('当前视图被销毁===dispose=== 类似iOS中delloc');
    super.dispose();
  }
// 监听应用进入前台后台的方法
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        print('app 将要进入后台/或者前台 不接受交互');
        break;
      case AppLifecycleState.paused:
        print('app不接受交互 进入模式后台');
        break;
      case AppLifecycleState.resumed:
        print('app可见，可接受交互，从后台进入到前台的时候调用');
        break;
      case AppLifecycleState.suspending:
        print('应用被挂起 在iOS中目前没有使用到');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    print('==  只要调用setstate  就会走很多遍  ==build===build');
        int counter = widget.counter;

    return Material(
      child: new Scaffold(
        appBar: new AppBar(
          
          title: Text('点击了 $counter  次'),
        ),
        body: renderCenterBody(),
      ),
    );
  }

// 渲染body
  Widget renderCenterBody() {
    int counter = widget.counter;
    return Center(
      child: Column(
        children: <Widget>[
          Text('点击了 $counter  次'),
          FlatButton(
            onPressed: updateContent,
            textColor: Colors.red,
          child: Container(
          child: Text('哈哈哈哈哈'),
          color: Colors.green,
          ),
          ),
        ],
      ),
    );
  }
}

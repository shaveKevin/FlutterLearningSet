import 'package:flutter/material.dart';
// 导入拍照和选取图片的插件
import 'package:image_picker/image_picker.dart';
// 为了使用File 文件 导入IO文件操作库
import 'dart:io';
// 导入网络请求库
import 'package:dio/dio.dart';
// 把图片从file转换为base64
import 'dart:convert';
// toast提示
import 'package:toast/toast.dart';

// 声明请求的实例
Dio dio = new Dio();
// 程序的入口 iOS中的main函数 MyApp类似于iOS中的Appdelegate
void main() => runApp(MyApp());

// 程序的入口vc 类似于iOS中的window
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  // 类似iOS中渲染Appdelegate中的window
  Widget build(BuildContext context) {
    // 返回一个带有导航条的视图(iOS中类似于返回一个带有navigationbar的vc)
    return MaterialApp(
      // 标题
      title: 'Flutter Demo',
      //主题
      theme: ThemeData(
        //整个app色调(这和iOS中不同，iOS中默认的色调是clearColor)
        primarySwatch: Colors.pink,
      ),
      //这里是设置rootVC
      home: MyHomePage(title: '颜值大师'),
      // 去除navigationbar的debug模式
      debugShowCheckedModeBanner: false,
    );
  }
}

// 类似于iOS中某个类的.h文件
class MyHomePage extends StatefulWidget {
  // 调用super方法
  MyHomePage({Key key, this.title}) : super(key: key);
  // 定义一个只初始化一次的属性title（这里是dart语法）
  final String title;
  @override
  //由于这个类MyHomePage是需要保存状态的widget -> StatefulWidget
  //所以，它重写createState()来创建状态对象。框架会在构建widget时调用createState()
  _MyHomePageState createState() => _MyHomePageState();
}

// .m 文件
class _MyHomePageState extends State<MyHomePage> {
  // 是否显示loading
  bool isLoading = false;
  // 声明文件属性(保存选择的图片或者通过摄像头拍照获取的照片)
  File _image;
  // 声明一个变量用来保存请求获取的个人颜值信息
  var _faceInfo;
  // 性别
  Map genderMap = {'male': '男', 'female': '女'};
// 表情
  Map expressionMap = {'none': '不笑', 'smile': '微笑', 'laugh': '大笑'};
// 眼镜
  Map glassesMap = {'none': '无眼镜', 'common': '普通眼镜', 'sun': '墨镜'};
// 情绪
  Map emotionMap = {
    'angry': '愤怒',
    'disgust': '厌恶',
    'fear': '恐惧',
    'happy': '高兴',
    'sad': '伤心',
    'surprise': '惊讶',
    'neutral': '无情绪'
  };
  // 实现一个选择图片的方法
  // 这里的形参中source选择照片有两种方式
  //ImageSource.camera调用相机拍照并获取图片
  //ImageSource.gallery  从本地相册中获取图片
  void choosePic(ImageSource source) async {
    // 这里是异步的 所以要加上await。 然后方法后面加上async 得到选取的照片
    var image = await ImagePicker.pickImage(source: source);
    // 如果没有获取到图片就返回
    if (image == null) {
      Toast.show("未获取到图片!", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
      return;
    }
    //调用setState()是至关重要的，因为这告诉框架，widget的状态已经改变，应该重绘。 同iOS中的drawRect。
    setState(() {
      // 把用户选择的照片存储到_image中
      _image = image;
      // 重置faceInfo的值防止选取一次之后重新选取的时候，UI上突兀更新
      _faceInfo = null;
    });
    // dart中打印用print函数
    print(image);
    //调用api获取颜值信息
    getFaceInfo();
  }

  //调用api获取颜值信息
  void getFaceInfo() async {
    isLoading = true;
    // 1.鉴权
    var url1 =
        "https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=Pl2B3TnrjZRKHQj3s9z7Dr4x&client_secret=DihYYWIT9Wri30uA5H42y0zV2wSAzdhA";

    var accessResult = await dio.post(url1);
    var accessToken = accessResult.data['access_token'];
    print(accessToken);
    if (accessToken != null) {
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      Toast.show("获取token失败！", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
      return;
    }
    // 2.把图片从File类型转化为Base64
    // 2.1 先将照片转换为字节数组
    // 2.2 将字节数组转换为base64格式的字符串
    var bytesList = _image.readAsBytesSync();
    var base64Img = base64Encode(bytesList);

    // 3.调用获取颜值信息api
    var testFaceUrl =
        "https://aip.baidubce.com/rest/2.0/face/v3/detect?access_token=" +
            accessToken;
    var faceInfoResult = await dio.post(
      testFaceUrl,
      options: new Options(contentType: ContentType.json),
      // 在flutter中，对象的属性必须用‘’包裹起来
      data: {
        'image': base64Img,
        'image_type': 'BASE64',
        'face_field': 'age,beauty,expression,face_shape,gender,glasses,emotion'
      },
    );
    // 获取到人脸信息
    print(faceInfoResult.data);
    if (faceInfoResult.data['error_msg'] == 'SUCCESS') {
      setState(() {
        isLoading = false;
        _faceInfo = faceInfoResult.data['result']['face_list'][0];
      });
    } else {
      setState(() {
        isLoading = false;
        Toast.show("鉴权失败！", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
      });
    }
  }

  @override
  // 渲染页面
  Widget build(BuildContext context) {
    //  一个页面相当于一个Scaffold  Scaffold 相当于插槽  body是主体  floatingActionButton 悬浮的按钮
    return Scaffold(
      appBar: renderAppBar(),
      body: renderBody(),
      floatingActionButton:
          renderFloatingActionButton(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // 渲染头部appBar区域
  Widget renderAppBar() {
    return AppBar(
      title: Text(
        // 设置文本
        widget.title,
        // title文本样式
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      // 让title居中
      centerTitle: true,
    );
  }

// 渲染页面主体区域
  Widget renderBody() {
    // 如果用户没有选择任何照片，只渲染文本
    if (_image == null) {
      return Center(
        child: Text('暂无图片！'),
      );
    }
    // 如果有照片就去渲染对应的图片
    return renderResult();
  }

  Widget renderResult() {
    // 如果人脸信息不为空,渲染UI
    return Stack(
      children: <Widget>[
        // 渲染返回的Image
        Image.file(
          // 被渲染的图片
          _image,
          // 图片填充模式
          fit: BoxFit.cover,
          //图片高度撑满整个页面的高度
          width: double.infinity,
          // 图片的高度撑满整个页面的高度
          height: double.infinity,
        ),
        // 渲染faceInfo
        renderFaceInfo(),
      ],
    );
  }

// 渲染识别出来的人脸信息
  Widget renderFaceInfo() {
    // 容错，如果没有获取到信息，返回的是一个空的label
    if (_faceInfo == null) {
      if (isLoading) {
        return Center(child: CircularProgressIndicator());
      }
      return Text('');
    }
    //设置一个居中的控件
    return Center(
      // 先设置外面的container容器 居中显示
      child: Container(
        // 圆角
        decoration: BoxDecoration(
            //半透明的白色
            color: Colors.white54,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        // 盒子的宽度
        width: 300,
        // 盒子的高度
        height: 200,
        // 子视图  列组件(虽然只有一列)
        child: Column(
          //子视图的纵���分散对齐
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // 一共有三行 每行包括两个text文本元素(行组件)
            Row(
              //每行控件的对齐方式 分散对齐  横轴
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // 子控件
              children: <Widget>[
                Text('年龄:${_faceInfo['age']}岁'),
                Text('性别:${genderMap[_faceInfo['gender']['type']]}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('颜值:${_faceInfo['beauty']}分'),
                Text('表情:${expressionMap[_faceInfo['expression']['type']]}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('眼镜:${glassesMap[_faceInfo['glasses']['type']]}'),
                Text('情绪:${emotionMap[_faceInfo['emotion']['type']]}'),
              ],
            )
          ],
        ),
      ),
    );
  }

  //渲染多个浮动按钮
  Widget renderFloatingActionButton() {
    // 一组按钮ButtonBar
    return ButtonBar(
      // 按钮的在水平方向上的对齐方式。
      // spaceAround 分散对齐
      alignment: MainAxisAlignment.spaceAround,
      // 当前组中的组员
      children: <Widget>[
        // 第一个浮动按钮
        FloatingActionButton(
          //点击事件
          onPressed: () {
            choosePic(ImageSource.camera);
          },
          //这只是一个标识长按文字提示
          tooltip: 'photo_camera',
          heroTag: "photo_camera",

          // 按钮的设置
          child: Icon(Icons.photo_camera),
        ),
        // 第二个浮动按钮
        FloatingActionButton(
          onPressed: () {
            choosePic(ImageSource.gallery);
          },
          tooltip: 'photo_library',
           // 如果一个页面有两个FloatingActionButton的时候
          heroTag: "photo_library",
          child: Icon(Icons.photo_library),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hello_world/SampleStateless.dart';
import 'package:hello_world/SampleStateful.dart';
import 'package:hello_world/SearchingPage.dart';
import 'package:hello_world/ScrapingPage.dart';
import 'package:hello_world/WebViewPage.dart';
import 'package:hello_world/MultiplesHighlight.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController(initialPage: 0);

  // ボトムメニューの遷移先画面
  var _pages = [
    SampleStateless(),
    SampleStateful(),
    MultiplesHighlight(),
    //TestPage2(),
    //ScrapingPage(),
    //SearchingPage(),

    //WebViewPage(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: _pages));
  }
}

import 'package:flutter/material.dart';

class SampleStateful extends StatefulWidget {
  @override
  _SampleStatefulState createState() => _SampleStatefulState();
}

/*
 * 大きなグリッドとプルダウンのみの画面
 * 大きなグリッドには1~99までの数字を並べる
 * プルダウンには、nの倍数と書かれたリストを表示する。
 * プルダウンで選択すると、適合しているグリッドの数字がハイライトされるような仕掛け
 * 
*/
class _SampleStatefulState extends State<SampleStateful> {
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StatefulPage'),
        ),
        body: Center(
            child: Container(
                color: Colors.redAccent,
                child: Text("StatefulPage", style: TextStyle(fontSize: 40)))));
  }
}

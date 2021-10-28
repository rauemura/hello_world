import 'package:flutter/material.dart';
import 'dart:math';

class MultiplesHighlight extends StatefulWidget {
  @override
  _MultiplesHighlightState createState() => _MultiplesHighlightState();
}

/*
 * 大きなグリッドとプルダウンのみの画面
 * 大きなグリッドには1~99までの数字を並べる
 * プルダウンには、nの倍数と書かれたリストを表示する。
 * プルダウンで選択すると、適合しているグリッドの数字がハイライトされるような仕掛け
 * 
*/
class _MultiplesHighlightState extends State<MultiplesHighlight> {
  List<DropdownMenuItem<int>> _playersDropDownItems = [];
  int _dropDownItemIndex = 1;
  @override
  void initState() {
    setPlayersDropDownItems();
    super.initState();
  }

  DropdownMenuItem<int> _makePlayersDropDownMenuItem(int num) {
    return DropdownMenuItem(
      child: Text(num.toString() + 'players'),
      value: num,
    );
  }

  void setPlayersDropDownItems() {
    _playersDropDownItems
      ..add(_makePlayersDropDownMenuItem(1))
      ..add(_makePlayersDropDownMenuItem(2))
      ..add(_makePlayersDropDownMenuItem(3))
      ..add(_makePlayersDropDownMenuItem(4))
      ..add(_makePlayersDropDownMenuItem(5))
      ..add(_makePlayersDropDownMenuItem(6))
      ..add(_makePlayersDropDownMenuItem(7))
      ..add(_makePlayersDropDownMenuItem(8))
      ..add(_makePlayersDropDownMenuItem(9))
      ..add(_makePlayersDropDownMenuItem(10));
  }

  // List<DataColumn> _dataColumn = [
  //   DataColumn(label: Text('0')),
  //   DataColumn(label: Text('1')),
  //   DataColumn(label: Text('2')),
  // ];

  Color _highLight(int num) {
    if (num % _dropDownItemIndex == 0) {
      return Colors.red.shade100;
    }
    return Colors.white;
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MultiplesHighlight'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          //DataTable(columns: _dataColumn, rows: _rows)
          DefaultTextStyle(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.1,
              color: Colors.black,
            ),
            child: Center(
                child: Table(
              border: TableBorder.all(color: Colors.black26),
              defaultColumnWidth: FixedColumnWidth(28.0),
              children: [
                TableRow(children: [
                  for (int i = 1; i < 14; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 14; i < 27; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 27; i < 40; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 40; i < 53; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 53; i < 66; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 66; i < 79; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 79; i < 92; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 92; i < 105; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 105; i < 118; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 118; i < 131; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 131; i < 144; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 144; i < 157; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 157; i < 170; i++)
                    Container(child: Text(i.toString()), color: _highLight(i)),
                ]),
              ],
            )),
          ),
          DropdownButton<int>(
            //alignment: Alignment.center,
            items: _playersDropDownItems,
            value: _dropDownItemIndex,
            onChanged: (int? value) {
              setState(() {
                _dropDownItemIndex = value!; //int? のintへのCastingは!で行う。
              });
            },
          ),
          Container(
              height: 100,
              child: CustomPaint(
                size: const Size(45, 45),
                painter: CirclePaint(),
              )),
        ]));
  }
}

class CirclePaint extends CustomPainter {
  //長方形の角を丸めればいいんだ
  @override
  void paint(Canvas canvas, Size size) {
    print('Size(${size.width},${size.height})'); // Size(100,100)
    final paint = Paint()..color = Colors.red;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height);
    canvas.drawCircle(center, radius, paint);
  }

  // 再描画する必要なし
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

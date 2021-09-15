import 'package:flutter/material.dart';

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
  List<DropdownMenuItem<int>> _multipleItems = [];
  int _dropDownItemIndex = 1; //null Safety
  @override
  void initState() {
    setItems();
    //_value = _multipleItems[0].value; 不要？
    super.initState();
  }

  DropdownMenuItem<int> _makeMultipleMenuItem(int num) {
    return DropdownMenuItem(
      child: Text(num.toString() + 'の倍数'),
      value: num,
    );
  }

  void setItems() {
    _multipleItems
      ..add(_makeMultipleMenuItem(1))
      ..add(_makeMultipleMenuItem(2))
      ..add(_makeMultipleMenuItem(3))
      ..add(_makeMultipleMenuItem(4))
      ..add(_makeMultipleMenuItem(5))
      ..add(_makeMultipleMenuItem(6))
      ..add(_makeMultipleMenuItem(7));
  }

  // List<DataColumn> _dataColumn = [
  //   DataColumn(label: Text('0')),
  //   DataColumn(label: Text('1')),
  //   DataColumn(label: Text('2')),
  // ];

  Color _highLight(int num) {
    if (num % _dropDownItemIndex == 0) {
      return Colors.red;
    }
    return Colors.white;
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MultiplesHighlight'),
        ),
        body: Column(children: <Widget>[
          //DataTable(columns: _dataColumn, rows: _rows)
          DefaultTextStyle(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
            child: Center(
                child: Table(
              border: TableBorder.all(color: Colors.black26),
              defaultColumnWidth: FixedColumnWidth(28.0),
              children: [
                TableRow(children: [
                  for (int i = 1; i < 15; i++)
                    Container(
                        child: Text(i.toString() + "."), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 15; i < 29; i++)
                    Container(
                        child: Text(i.toString() + "."), color: _highLight(i)),
                ]),
                TableRow(children: [
                  for (int i = 29; i < 43; i++)
                    Container(
                        child: Text(i.toString() + "."), color: _highLight(i)),
                ]),
              ],
            )),
          ),
          DropdownButton<int>(
            //alignment: Alignment.center,
            items: _multipleItems,
            value: _dropDownItemIndex,
            onChanged: (int? value) {
              setState(() {
                _dropDownItemIndex = value!; //int? のintへのCastingは!で行う。
              });
            },
          ),
        ]));
  }
}

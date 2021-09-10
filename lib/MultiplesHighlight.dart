
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
  int? _selectedMultipleItemIndex = 0; //null Safety
  @override
  void initState() {
    // TODO: implement initState
    setItems();
    _selectedMultipleItemIndex = _multipleItems[0].value;
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  //TODO　Gridを用意
  var list = [
    Container(child:Text('1')),
    Container(child:Text('2')),
    Container(child:Text('3')),
    Container(child:Text('4')),
    Container(child:Text('5')),
    Container(child:Text('5')),
    Container(child:Text('5')),
    Container(child:Text('5')),
    Container(child:Text('5')),
    Container(child:Text('5')),
  ];

  //TODO　プルダウンを用意

  void setItems(){
    _multipleItems
      ..add(DropdownMenuItem(
        child:Text('2の倍数'),
        value:2,
      ))
      ..add(DropdownMenuItem(
        child:Text('3の倍数'),
        value:3,
      ))
      ..add(DropdownMenuItem(
        child:Text('4の倍数'),
        value:4,
      ));
  }

  List<DataColumn> _dataColumn = [
    DataColumn(label: Text('0')),
    DataColumn(label: Text('1')),
    DataColumn(label: Text('2')),
  ];

  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
            title: Text('test1'),
      ),
      body: Column(children: <Widget>[
        //DataTable(columns: _dataColumn, rows: _rows)
        DropdownButton<int>(
          alignment: Alignment.center,
          items: _multipleItems,
          value: _selectedMultipleItemIndex,
          onChanged: (value) => {
            setState((){
            _selectedMultipleItemIndex = value;
            }),
          },
        ),
      ]
      )
    );  
  }
}
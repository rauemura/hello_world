import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TestPage2 extends StatefulWidget {
  @override
  _TestPage2State createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  late List<Employee> _employees;
  late EmployeeDataSource _employeeDataSource;

  @override
  initState(){
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(_employees);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: Text('Test2'),
      ),
      body: SfDataGrid(source: _employeeDataSource,
      selectionMode: SelectionMode.multiple, //single, singleDeselect 行を複数選択できる
      allowSorting: true,
      columns: [
        GridTextColumn(columnName: 'id', label: Container(padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerRight,
        child: Text('ID', overflow: TextOverflow.ellipsis,),)),
        GridTextColumn(columnName: 'name', label: Container(padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerRight,
        child: Text('NAME', overflow: TextOverflow.ellipsis,),)),
        GridTextColumn(columnName: 'designation', label: Container(padding: EdgeInsets.symmetric(horizontal: 4.0),
        alignment: Alignment.centerRight,
        child: Text('DESIGNATION', overflow: TextOverflow.ellipsis,),)),
        GridTextColumn(columnName: 'salary', label: Container(padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerRight,
        child: Text('SALARY', overflow: TextOverflow.ellipsis,),)),
      ],),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



}
  List<Employee> getEmployeeData(){
    return [
      Employee(10001, 'Adam', 'PL', 20000),
      Employee(10001, 'Adam', 'PL', 20000),
      Employee(10001, 'Adam', 'PL', 20000),
      Employee(10001, 'Adam', 'PL', 20000),
      Employee(10001, 'Adam', 'PL', 20000),
      Employee(10001, 'Adam', 'PL', 20000),
      Employee(10001, 'Adam', 'PL', 20000),
      Employee(10001, 'Adam', 'PL', 20000),
      Employee(10001, 'Adam', 'PL', 20000)
    ];
  }

  class EmployeeDataSource extends DataGridSource{
    EmployeeDataSource(List<Employee> employees){
      dataGridRows = employees
      .map<DataGridRow>((dataGridRow) => DataGridRow(cells:[
      DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
      DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
      DataGridCell<String>(columnName: 'designation', value: dataGridRow.designation),
      DataGridCell<int>(columnName: 'salary', value: dataGridRow.salary),
      ]))
      .toList();
    }
    late List<DataGridRow> dataGridRows;
    @override
    List<DataGridRow> get rows => dataGridRows;

    @override
    DataGridRowAdapter? buildRow(DataGridRow row) {
      return DataGridRowAdapter(cells: row.getCells().map<Widget>((dataGridCell){
        return Container(
          //セルを中央揃えに
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: (dataGridCell.columnName == 'id' ||
          dataGridCell.columnName == 'salary')
          ?Alignment.centerRight
          :Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList());
    }
  }
  class Employee {
    Employee(this.id, this.name, this.designation, this.salary);
    final int id;
    final String name;
    final String designation;
    final int salary;
  }

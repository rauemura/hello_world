import 'package:flutter/material.dart';

class TestPage2 extends StatefulWidget {
  @override
  _TestPage2State createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  int _counter = 0;
  var list = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test2'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 14,
              ),
              itemCount: 168,
              itemBuilder: (context, index) {
                return Card(
                  child: Center(child: Text('$_counter')),
                );
              }),
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        foregroundColor: Colors.black,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

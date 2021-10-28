import 'package:flutter/material.dart';

class SampleStateful extends StatefulWidget {
  @override
  _SampleStatefulState createState() => _SampleStatefulState();
}

class _SampleStatefulState extends State<SampleStateful> {
  bool _isEnabled = false;
  EdgeInsets _padding = EdgeInsets.all(0);
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulPage'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          changeShape();
        },
      ),
      body: Center(
        child: AnimatedContainer(
          alignment: Alignment.center,
          padding: _padding,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
          color: Colors.blue,
          curve: Curves.easeIn,
          duration: Duration(
            milliseconds: 400,
          ),
          height: 300,
          width: 300,
        ),
      ),
    );
  }

  void changeShape() {
    setState(() {
      _isEnabled = !_isEnabled;
      _padding = _isEnabled ? EdgeInsets.all(100) : EdgeInsets.all(0);
    });
  }
}

Widget hoge() {
  return Container();
}

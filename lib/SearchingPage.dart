import 'package:flutter/material.dart';
import "package:universal_html/controller.dart";

class SearchingPage extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<SearchingPage> {
  static const url_IFIS =
      'https://kabuyoho.ifis.co.jp/index.php?action=tp1&sa=report&bcode=';
  static const url_GIF = "https://kabuyoho.ifis.co.jp/img/graph/tech/";

  final controller = WindowController();
  _BrandInfo? _info = new _BrandInfo();

  @override
  void initState() {
    super.initState();
    _getNumbers();
  }

  String _brandNumber = '9101';

  void _handleText(String e) {
    setState(() {
      _brandNumber = e.trim();
      _getNumbers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Searching',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        TextField(
          enabled: true,
          onSubmitted: _handleText,
        ),
        _BrandInfoCard(brandInfo: _info),
      ])),
    );
  }

  _getNumbers() async {
    _getBrandInfo(_info!);
  }

  _getBrandInfo(_BrandInfo brandInfo) async {
    brandInfo.gif = url_GIF + _brandNumber + ".gif";
    await controller.openHttp(uri: Uri.parse(url_IFIS + _brandNumber));
    final document = controller.window!.document;
    setState(() {
      brandInfo.value = document.querySelector("span.price")!.text!.trim();
      //brandInfo.name =
      //    document.querySelector("div.stock_name.left")!.text!.trim();
      brandInfo.settlement = document
          .querySelector("div.block_update.right")!
          .text!
          .replaceAll("\t", " ")
          .replaceAll("   ", " ")
          .replaceAll("\n", "");

      // final element = document
      //     .querySelector("div.highcharts_container")!
      //     .hasChildNodes(); //なぜ取れない？？？？？？？？？？？？？？
      brandInfo.name =
          document.querySelector("div.stock_name.left")!.text!.trim();
    });
  }
}

class _BrandInfo {
  _BrandInfo({
    this.value,
    this.name,
    this.settlement,
    this.gif,
    this.progress,
    //this.percent,
  });
  String? value;
  String? name;
  String? settlement;
  String? gif;
  String? progress;
  //String? percent;
}

class _BrandInfoCard extends StatelessWidget {
  const _BrandInfoCard({this.brandInfo});

  final _BrandInfo? brandInfo;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.network(brandInfo!.gif!),
      Container(
        width: 360,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.lightGreen,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WhiteText(brandInfo!.name!, 20),
            WhiteText(brandInfo!.value!, 20),
            WhiteText(brandInfo!.settlement!, 14),
            //WhiteText(brandInfo!.progress!, 14),
          ],
        ),
      )
    ]);
  }
}

Text WhiteText(String text, double fontsize) {
  return Text(text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontsize,
      ));
}

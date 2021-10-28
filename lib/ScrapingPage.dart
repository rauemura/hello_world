import 'package:flutter/material.dart';
import "package:universal_html/controller.dart";

class ScrapingPage extends StatefulWidget {
  @override
  _ScrapingPageState createState() => _ScrapingPageState();
}

class _ScrapingPageState extends State<ScrapingPage> {
  static const url_BDIY = 'https://moneybox.jp/cfd/detail.php?t=baltic';
  static const url_SOXX = 'https://moneybox.jp/cfd/detail.php?t=%5ESOX';
  static const url_N225 = 'https://moneybox.jp/cfd/detail.php?t=^N225';
  static const url_DJI = 'https://moneybox.jp/cfd/detail.php?t=^DJI';
  static const url_VIX = 'https://moneybox.jp/cfd/detail.php?t=^VIX';
  static const url_BTC =
      'https://moneybox.jp/virtualmoney/detail.php?u=bitcoin';
  static const url_JPN =
      'https://www.rakuten-sec.co.jp/web/market/data/jp10yt.html';

  final controller = WindowController();
  _BrandInfo? _infoSOXX = new _BrandInfo();
  _BrandInfo? _infoBDIY = new _BrandInfo();
  _BrandInfo? _infoN225 = new _BrandInfo();
  _BrandInfo? _infoDJI = new _BrandInfo();
  _BrandInfo? _infoVIX = new _BrandInfo();
  _BrandInfo? _infoBTC = new _BrandInfo();
  _BrandInfo? _infoJPN = new _BrandInfo();

  @override
  void initState() {
    super.initState();
    _getNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scraping',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        _BrandInfoCard(brandInfo: _infoSOXX),
        _BrandInfoCard(brandInfo: _infoBDIY),
        _BrandInfoCard(brandInfo: _infoN225),
        _BrandInfoCard(brandInfo: _infoDJI),
        _BrandInfoCard(brandInfo: _infoVIX),
        _BrandInfoCard(brandInfo: _infoBTC),
        //_BrandInfoCard(brandInfo: _infoJPN),
      ])),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     Icons.refresh,
      //     color: Colors.white,
      //   ),
      //   onPressed: _getNumbers,
      // ),
    );
  }

  _getNumbers() async {
    _getBrandInfo(_infoSOXX!, "SOXX", url_SOXX);
    _getBrandInfo(_infoBDIY!, "BDIY", url_BDIY);
    _getBrandInfo(_infoN225!, "N225", url_N225);
    _getBrandInfo(_infoDJI!, "DJI", url_DJI);
    _getBrandInfo(_infoVIX!, "VIX", url_VIX);
    _getBrandInfo(_infoBTC!, "BTC", url_BTC);
    //_getSBIInfo(_infoJPN!, "JPN", url_JPN);
  }

  _getBrandInfo(_BrandInfo brandInfo, String name, String url) async {
    brandInfo.name = name;
    await controller.openHttp(uri: Uri.parse(url));
    final document = controller.window!.document;
    setState(() {
      brandInfo.value = document.querySelector("li.price")!.text!.trim();
      brandInfo.variation = document.querySelector("li.price2")!.text;
    });
  }

  _getSBIInfo(_BrandInfo brandInfo, String name, String url) async {
    brandInfo.name = name;
    await controller.openHttp(uri: Uri.parse(url));
    final document = controller.window!.document;
    setState(() {
      final value = document.querySelectorAll(".tbl-data-01"); //.first.text;
      final variation =
          document.querySelectorAll("span.down-02"); //.first.text;
      final variation2 = document.querySelectorAll("span.down-02");
    });
  }
}

class _BrandInfo {
  _BrandInfo({
    this.value,
    this.name,
    this.variation,
    //this.percent,
  });
  String? value;
  String? name;
  String? variation;
  //String? percent;
}

class _BrandInfoCard extends StatelessWidget {
  const _BrandInfoCard({this.brandInfo});

  final _BrandInfo? brandInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.lightGreen,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            brandInfo!.value!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            brandInfo!.name!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Text(
            brandInfo!.variation!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

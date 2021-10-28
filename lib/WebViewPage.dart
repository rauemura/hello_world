import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import "package:universal_html/controller.dart";
import 'package:charset_converter/charset_converter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  String root_url = 'https://jp.kabumap.com/servlets/kabumap/';
  String img_url = '';
  String ranking_url =
      "https://jp.kabumap.com/servlets/kabumap/Action?SRC=marketIndustry/base";
  final controller = WindowController();
  @override
  void initState() {
    super.initState();
    _getRanking();
  }

  _getRanking() async {
    img_url = root_url;
    var response = await http.Client().get(Uri.parse(ranking_url));
    String? decoded_body_byte =
        await CharsetConverter.decode("SHIFT-JIS", response.bodyBytes);
    //String decoded =
    //Utf8Decoder(allowMalformed: true).convert(response.bodyBytes);
    //await controller.openHttp(uri: Uri.parse(ranking_url));
    final document = controller.window!.document;
    setState(() {
      final img_url = document.querySelectorAll("img");
      //[0].text!.trim();
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulPage'),
      ),
      body: Center(
        child: Image.network(img_url),
      ),
    );
  }
}

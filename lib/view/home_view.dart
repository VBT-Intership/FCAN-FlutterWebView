import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  WebViewController _webViewController;
  String filePath = "asset/web.html";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildWebView(),
    );
  }

  WebView buildWebView() {
    return WebView(
      initialUrl: "",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _webViewController = webViewController;
        _loadHtmlFromAssets();
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("WEB"),
    );
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: "text/html", encoding: Encoding.getByName("utf-8"))
        .toString());
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// File tab3_demo
// @project flutter_base
// @author minhhoang on 25-06-2020
class Tab3Demo extends StatefulWidget {
  @override
  _Tab3DemoState createState() => _Tab3DemoState();
}

class _Tab3DemoState extends State<Tab3Demo> {
  final Completer<WebViewController> _controller=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "hoangcongcar.com",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (webViewController){
        _controller.complete(webViewController);
      },
    );
  }
}
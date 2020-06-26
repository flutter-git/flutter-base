import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// File tab3_page
// @project flutter_base
// @author minhhoang on 25-06-2020
class Tab3Page extends StatefulWidget {
  @override
  _Tab3PageState createState() => _Tab3PageState();
}

class _Tab3PageState extends State<Tab3Page> {
  final Completer<WebViewController> _controller=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return  WebView(
      initialUrl: "http://hoangcongcar.com/",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (webViewController){
        _controller.complete(webViewController);
      },
    );
  }
  @override
  void initState() {
    print("Tab3Page: initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("Tab3Page: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Tab3Page oldWidget) {
    print("Tab3Page: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    print("Tab3Page: dispose");
    super.dispose();
  }
}
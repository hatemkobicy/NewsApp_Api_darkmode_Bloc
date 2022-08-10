// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewscreen extends StatelessWidget {


  final String url1;

  WebViewscreen(this.url1);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: WebView(initialUrl: url1,));
  }
}

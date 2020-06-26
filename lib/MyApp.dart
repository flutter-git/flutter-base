import 'package:flutter/material.dart';
import 'package:flutterbase/ui/main_app.dart';

// File MyApp
// @project flutter_base
// @author minhhoang on 25-06-2020
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MainApp()
    );
  }
}
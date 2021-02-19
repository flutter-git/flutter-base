import 'package:common/common.dart';
import 'package:common/core/wrap_main.dart';
import 'package:flutter/material.dart';
import 'package:flutterbase/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedSync = await shared;
  runApp(WrapMain(
    sharedPreferences: sharedSync,
    child: MyApp(),
  ));
}

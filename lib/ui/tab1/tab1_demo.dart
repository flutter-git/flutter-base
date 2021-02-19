import 'package:common/core/base_container.dart';
import 'package:common/core/navigator_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutterbase/ui/main_app.dart';
import 'package:flutterbase/ui/tab1/tab_full_screen.dart';

// File tab1_demo
// @project flutter_base
// @author minhhoang on 25-06-2020
class Tab1Demo extends StatefulWidget {
  @override
  _Tab1DemoState createState() => _Tab1DemoState();
}

class _Tab1DemoState extends State<Tab1Demo> {
  var a = 1;

  @override
  Widget build(BuildContext context) {
    print("Tab1Demo build");
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: () {
                NavigatorManager.push(context, Tab1Demo());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Tab1Demo $a"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                CustomNavigatorTabBar.of(context).setCurrentIndex=4;
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("move tab5"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
              setState(() {
                a++;
              });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("setState"),
              ),
            ), SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                NavigatorManager.pushFullScreen(context, TabFullScreen());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("full screen"),
              ),
            ),
          ],
        ),
      )),
    );
  }

  @override
  void initState() {
    print("Tab1Demo: initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("Tab1Demo: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Tab1Demo oldWidget) {
    print("Tab1Demo: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("Tab1Demo: dispose");
    super.dispose();
  }
  @override
  void deactivate() {
    print("${this.toString()} deactivate");
    super.deactivate();
  }
}

import 'package:flutter/material.dart';

// File tab_full_screen
// @project flutter_base
// @author minhhoang on 26-06-2020
class TabFullScreen extends StatefulWidget {
  @override
  _TabFullScreenState createState() => _TabFullScreenState();
}

class _TabFullScreenState extends State<TabFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Text("TabFullScreen")))
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
  void didUpdateWidget(TabFullScreen oldWidget) {
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
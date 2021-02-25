import 'package:common/core/navigator_manager.dart';
import 'package:flutter/material.dart';

// File tab5_demo
// @project flutter_base
// @author minhhoang on 25-06-2020
class Tab5Demo extends StatefulWidget {
  @override
  _Tab5DemoState createState() => _Tab5DemoState();
}

class _Tab5DemoState extends State<Tab5Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
            child: InkWell(
              onTap: (){
                NavigatorManager.push(context, Tab5Demo());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Tab5Demo"),
              ),
            ),
          )
      ),
    );
  }
  @override
  void initState() {
    print("Tab5Demo: initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("Tab5Demo: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Tab5Demo oldWidget) {
    print("Tab5Demo: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    print("Tab5Demo: dispose");
    super.dispose();
  }
}
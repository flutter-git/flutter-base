import 'package:common/core/navigator_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutterbase/ui/tab1/tab1_demo.dart';

// File tab1_page
// @project flutter_base
// @author minhhoang on 25-06-2020
class Tab1Page extends StatefulWidget {
  static GlobalKey<NavigatorState> tab1Navigator=GlobalKey();
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>  {

  @override
  Widget build(BuildContext context) {
    print("${this.toString()}: build");
    return Container(
        color: Colors.red,
        child: Center(
            child: InkWell(
              onTap: () {
                NavigatorManager.push(context, Tab1Demo());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Tab1Page"),
              ),
            )));
  }

  @override
  void initState() {
    print("${this.toString()}: initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("${this.toString()}: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Tab1Page oldWidget) {
    print("${this.toString()}: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    print("${this.toString()}: dispose");
    super.dispose();
  }
  @override
  void deactivate() {
    print("${this.toString()} deactivate");
    super.deactivate();
  }
}

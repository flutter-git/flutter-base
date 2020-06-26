import 'package:flutter/material.dart';

// File tab2_page
// @project flutter_base
// @author minhhoang on 25-06-2020
class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
        child: Text("Tab2Page")
    );
  }
  @override
  void initState() {
    print("Tab2Page: initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("Tab2Page: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Tab2Page oldWidget) {
    print("Tab2Page: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    print("Tab2Page: dispose");
    super.dispose();
  }
}
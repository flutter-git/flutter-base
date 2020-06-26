import 'package:flutter/material.dart';

// File tab4_page
// @project flutter_base
// @author minhhoang on 25-06-2020
class Tab4Page extends StatefulWidget {
  @override
  _Tab4PageState createState() => _Tab4PageState();
}

class _Tab4PageState extends State<Tab4Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
        child: Text("Tab4Page")
    );
  }
  @override
  void initState() {
    print("Tab4Page: initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("Tab4Page: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Tab4Page oldWidget) {
    print("Tab4Page: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    print("Tab4Page: dispose");
    super.dispose();
  }
}
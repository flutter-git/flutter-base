import 'package:common/core/navigator_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutterbase/ui/tab5/tab5_demo.dart';

// File tab5_page
// @project flutter_base
// @author minhhoang on 25-06-2020
class Tab5Page extends StatefulWidget {
  @override
  _Tab5PageState createState() => _Tab5PageState();
}

class _Tab5PageState extends State<Tab5Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          color: Colors.amber,
          child: InkWell(
            onTap: () {
              NavigatorManager.push(context, Tab5Demo());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Tab5Page"),
            ),
          )),
    );
  }

  @override
  void initState() {
    print("Tab5Page: initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("Tab5Page: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Tab5Page oldWidget) {
    print("Tab5Page: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("Tab5Page: dispose");
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutterbase/base/base_container.dart';
import 'package:flutterbase/ui/tab1/tab1_page.dart';
import 'package:flutterbase/ui/tab2/tab2_page.dart';
import 'package:flutterbase/ui/tab3/tab3_page.dart';
import 'package:flutterbase/ui/tab4/tab4_page.dart';
import 'package:flutterbase/ui/tab5/tab5_page.dart';

import 'custom_tab_controller.dart';

// File main_app
// @project flutter_base
// @author minhhoang on 25-06-2020
class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return  CustomNavigatorTabBar(
      children: [
        Tab1Page(),
        Tab2Page(),
        Tab3Page(),
        Tab4Page(),
        Tab5Page()
      ],
      childrenBottomNavigator: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text("Tab1")),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text("Tab2")),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), title: Text("Tab3")),
        BottomNavigationBarItem(
            icon: Icon(Icons.event_note), title: Text("Tab4")),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account), title: Text("Tab5")),
      ],
    );
  }
}

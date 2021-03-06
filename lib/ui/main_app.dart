import 'package:common/core/base_container.dart';
import 'package:flutter/material.dart';
import 'package:flutterbase/components/main/CustomBottomNavigationBarItem.dart';
import 'package:flutterbase/styles/colors.dart';
import 'package:flutterbase/ui/tab1/tab1_page.dart';
import 'package:flutterbase/ui/tab2/tab2_page.dart';
import 'package:flutterbase/ui/tab3/tab3_page.dart';
import 'package:flutterbase/ui/tab4/tab4_page.dart';
import 'package:flutterbase/ui/tab5/tab5_page.dart';
import 'package:localizations/generated/l10n.dart';

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
    return CustomNavigatorTabBar(
        children: [
          Tab1Page(),
          Tab2Page(),
          Tab3Page(),
          Tab4Page(),
          Tab5Page()
        ],
        bottomNavigationBar: (context, currentIndex) {
          return BottomNavigationBar(
              selectedItemColor: select,
              unselectedItemColor: unSelect,
              showUnselectedLabels: true,
              currentIndex: currentIndex,
              onTap: (index) {
                CustomNavigatorTabBar.of(context).setCurrentIndex = index;
              },
              items: [
                CustomBottomNavigationBarItem("Tab1", "ic_book"),
                CustomBottomNavigationBarItem("Tab2", "ic_new"),
                CustomBottomNavigationBarItem("Tab3", "ic_more"),
                CustomBottomNavigationBarItem("Tab4", "ic_more"),
                CustomBottomNavigationBarItem("Tab5", "ic_more"),
              ]);
        });
  }
}

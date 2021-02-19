import 'package:flutter/material.dart';
import 'package:flutterbase/styles/colors.dart';

// File CustomBottomNavigationBarItem
// @project learning
// @author minhhoang on 16-11-2020
class CustomBottomNavigationBarItem extends BottomNavigationBarItem {
  final String titleBar;
  final String nameImage;

  CustomBottomNavigationBarItem(this.titleBar, this.nameImage):super(
      icon:Image.asset(
          "assets/$nameImage.png", color: unSelect, width: 24, height: 24),
      title:FittedBox(child: Text(titleBar)),
      activeIcon: Image.asset(
        "assets/$nameImage.png", color: select, width: 24, height: 24,)
  );
}
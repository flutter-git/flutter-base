// File custom_tab_controller
// @project flutter_base
// @author minhhoang on 25-06-2020
import 'package:flutter/material.dart';

class CustomTabController extends TabController {
  @override
  void animateTo(int value, {Duration duration = kTabScrollDuration, Curve curve = Curves.ease}) {
    super.animateTo(value, duration: null, curve: null);
  }

  CustomTabController({length, vsync,initialIndex}):super(length:length,vsync:vsync,initialIndex:initialIndex);
}
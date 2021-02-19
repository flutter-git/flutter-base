import 'package:flutter/material.dart';
import 'package:flutterbase/generated/l10n.dart';
import 'package:flutterbase/styles/colors.dart';

// File ButtonLogin
// @project learning
// @author minhhoang on 30-11-2020
class ButtonLogin extends StatelessWidget {
  final GestureTapCallback onTap;

  const ButtonLogin({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: select,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [BoxShadow(color: black.withAlpha(100), offset: Offset(0, 4))]),
        padding: EdgeInsets.all(15),
        child: Center(
            child: Text(
          S.current.login,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: white),
        )),
      ),
    );
  }
}

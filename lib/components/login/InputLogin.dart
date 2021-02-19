import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbase/styles/colors.dart';

// File InputLogin
// @project learning
// @author minhhoang on 30-11-2020

class InputLogin extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool fieldPassword;
  final String labelText;
  final Widget prefixIcon;

  const InputLogin({Key key, this.controller, this.hintText, this.fieldPassword = false, this.labelText, this.prefixIcon}) : super(key: key);

  @override
  _InputLoginState createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  bool _obscureText;
  bool close = false;
  double _sizeIcon = 18.0;

  @override
  void initState() {
    _obscureText = widget.fieldPassword;
    widget.controller.addListener(() {
      if (widget.controller.text.isEmpty) {
        if (close)
          setState(() {
            close = false;
          });
      } else {
        if (!close)
          setState(() {
            close = true;
          });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color: black, fontSize: 20),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          border: OutlineInputBorder(borderSide: BorderSide(color: black), borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: select), borderRadius: BorderRadius.all(Radius.circular(10))),
          filled: true,
          prefixIcon: widget.prefixIcon,
          fillColor: white,
          hintText: widget.hintText,
          suffixIcon: widget.fieldPassword
              ? _obscureText
                  ? InkWell(
                      onTap: () {
                        _obscureText = false;
                        setState(() {});
                      },
                      child: Icon(
                        CupertinoIcons.eye,
                        color: black,
                        size: _sizeIcon,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        _obscureText = true;
                        setState(() {});
                      },
                      child: Icon(
                        CupertinoIcons.eye_slash,
                        size: _sizeIcon,
                        color: black,
                      ),
                    )
              : close
                  ? InkWell(
                      onTap: () {
                        widget.controller.clear();
                      },
                      child: Icon(
                        Icons.close,
                        color: black,
                        size: _sizeIcon,
                      ),
                    )
                  : null),
    );
  }
}

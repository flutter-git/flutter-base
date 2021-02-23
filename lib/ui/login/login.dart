import 'package:common/bloc/auth/auth_bloc.dart';
import 'package:common/core/base_widget.dart';
import 'package:common/utils/DialogUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbase/components/login/ButtonLogin.dart';
import 'package:flutterbase/components/login/InputLogin.dart';
import 'package:flutterbase/repository/user/UserRepository.dart';
import 'package:flutterbase/styles/colors.dart';
import 'package:localizations/generated/l10n.dart';

// File login
// @project flutter_base
// @author minhhoang on 11-11-2020

class Login extends StatefulWidget {
  final String message;

  const Login({Key key, this.message}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(widget.message != null) alertDialogConfirm(context,widget.message);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      keyScaffold: key,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bg_login.jpg"), fit: BoxFit.fitWidth, alignment: Alignment.bottomCenter),
            color: bgLogin),
        child: Center(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              InputLogin(
                controller: _userController,
                hintText: S.current.inputUsername,
                prefixIcon: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InputLogin(
                controller: _passwordController,
                hintText: S.current.inputPassword,
                fieldPassword: true,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ButtonLogin(
                onTap: () {
                  if (_userController.text.isEmpty) {
                    setMessage(S.current.pleaseInputUsername);
                    return;
                  }
                  if (_passwordController.text.isEmpty) {
                    setMessage(S.current.pleaseInputPassword);
                    return;
                  }
                  BlocProvider.of<AuthBloc>(context).add(AuthLogin(
                      auth: {}));
                },
              )
            ],
          ),
        ))),
      ),
    );
  }

  setMessage(String mess) {
    key.currentState.hideCurrentSnackBar();
    key.currentState.showSnackBar(SnackBar(
      backgroundColor: select,
      content: Text(
        mess,
        style: TextStyle(color: white, fontSize: 16),
      ),
    ));
  }
}

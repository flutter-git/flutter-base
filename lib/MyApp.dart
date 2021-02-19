import 'package:common/bloc/auth/auth_bloc.dart';
import 'package:common/common.dart';
import 'package:common/core/navigator_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutterbase/ui/login/login.dart';
import 'package:flutterbase/ui/main_app.dart';
import 'package:localizations/generated/AppLocale.dart';
import 'package:localizations/generated/l10n.dart';

// File MyApp
// @project flutter_base
// @author minhhoang on 25-06-2020
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigatorManager.navRoot,
      theme: ThemeData(primaryColor: Colors.white),
      title: "Learning",
      localizationsDelegates: [
          ...localizationsDelegates
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: S.delegate.resolution(fallback: AppLocale.ENGLISH),
      locale: _locale,
      // home: StateAuthentication.of(context).getStateAuth.widgetMain,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (BuildContext context, state) {
          if (state is AuthAuthenticated) return MainApp();
          return Login(message: state is AuthNoAuthenticated ? state.message : null,);
        },
      ),
    );
  }
}
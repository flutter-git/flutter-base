// File UserRepository
// @project learning
// @author minhhoang on 30-11-2020

import 'dart:convert';
import 'dart:io';

import 'package:flutterbase/shared/mixin/ApiManagerMixin.dart';

class UserRepository with ApiManagerMixin {
  static final UserRepository _singleton = UserRepository._internal();

  UserRepository._internal();

  factory UserRepository() => _singleton;
}

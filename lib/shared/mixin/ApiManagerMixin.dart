import 'dart:io';

import 'package:common/common.dart';
import 'package:common/core/api_provider.dart';
import 'package:flutter/material.dart';

class ApiManagerMixin {
  @protected
  final apiProvider = ApiProvider.builder(
    /**Host import here **/
    "host",
    interceptorOther: InterceptorWrapOtherImpl(),
    restResponse: <T>(Response response) async =>
        Future<T>.value(response.data),
    restError: (DioError error) async =>
        Future.error(error.response.data["message"] ?? error.toString()),
  );
}

class InterceptorWrapOtherImpl implements InterceptorWrapOther {
  @override
  error(DioError error) {
    if (error.response.statusCode == HttpStatus.unauthorized ||
        error.response.statusCode == HttpStatus.forbidden ||
        error.response.statusCode == HttpStatus.internalServerError) {}
    return error;
  }

  @override
  request(RequestOptions options) async {}

  @override
  response(Response<dynamic> response) {
    return response;
  }
}

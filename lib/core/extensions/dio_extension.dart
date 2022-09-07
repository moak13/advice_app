import 'dart:io';

import 'package:dio/dio.dart';

extension DioErrorX on DioError {
  String? get errorMessage {
    if (error is SocketException) {
      return 'No Internet Connection';
    }
    return 'Something went wrong';
  }
}

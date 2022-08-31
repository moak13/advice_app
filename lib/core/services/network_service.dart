import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../app/app.logger.dart';
import '../utils/config.dart';

abstract class DioHttpService {
  String get baseUrl;

  Map<String, String> get headers;

  Future<dynamic> appGet(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });
}

class DioHttpServiceImpl implements DioHttpService {
  final _log = getLogger('DioHttpServiceImpl');
  late final Dio dio;

  DioHttpServiceImpl() {
    dio = Dio(baseOptions);
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
        request: false,
        requestBody: true,
      ));
    }
  }
  @override
  String get baseUrl => Configs.baseUrl;

  @override
  Future appGet(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    _log.i('get call triggered');
    try {
      Response response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioError {
      rethrow;
    }
  }

  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  Map<String, String> get headers => {
        HttpHeaders.connectionHeader: 'keep-alive',
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
}

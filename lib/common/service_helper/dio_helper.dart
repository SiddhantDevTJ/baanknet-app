import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioApi {
  DioApi({this.isHeader = false, this.authKey, this.enableLogging = false});

  final bool isHeader;
  final String? authKey;
  final bool enableLogging; // Pass true to enable logging

  static Map<String, dynamic>? header = {};

  final Dio _dio = Dio(
    BaseOptions(
      contentType: 'application/json',
      validateStatus: ((status) => true),
      sendTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  Dio get sendRequest {
    if (isHeader) {
      header = {'Authorization': 'Bearer $authKey'};
    } else {
      header = null;
    }

    _dio.options.headers = header;

    // Add logging interceptor only if debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 120,
        ),
      );
    }
    return _dio;
  }
}

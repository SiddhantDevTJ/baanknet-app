import 'dart:io';

import 'package:dio/dio.dart';

String handleDioError(DioException error) {
  if (error.error is SocketException) {
    return 'No Internet';
  }
  switch (error.type) {
    case DioExceptionType.cancel:
      return 'Request was cancelled';
    case DioExceptionType.connectionTimeout:
      return 'Connection timeout occurred';
    case DioExceptionType.sendTimeout:
      return 'Request timed out while sending data';
    case DioExceptionType.receiveTimeout:
      return 'Request timed out while receiving data';
    case DioExceptionType.unknown:
      return 'Unknown Error';
    case DioExceptionType.badCertificate:
      return 'Invalid Certificate';
    case DioExceptionType.connectionError:
      return 'Connection Error';
    case DioExceptionType.badResponse:
      // Check the status code to provide more specific error messages
      int? statusCode = error.response?.statusCode;
      if (statusCode != null) {
        switch (statusCode) {
          case 400:
            return 'Bad request';
          case 401:
            return 'Unauthorized';
          case 403:
            return 'Forbidden';
          case 404:
            return 'Resource not found';
          case 500:
            return 'Internal server error';
          default:
            return 'Server error (Status code: $statusCode)';
        }
      }
      break;
  }
  return 'Something Went Wrong';
}

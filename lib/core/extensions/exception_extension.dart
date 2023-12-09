import 'package:dio/dio.dart';

extension ExceptionExtension on Exception {
  Exception handleException() {
    if (this is DioException) {
      final exception = this as DioException;
      switch (exception.type) {
        case DioExceptionType.connectionError:
          return Exception('No Internet Connection');
        case DioExceptionType.connectionTimeout:
          return Exception('Server take too much time.');
        default:
          return Exception('Request Failed with error code ${exception.response?.statusCode}');
      }
    }
    return Exception('Uknown Error');
  }
}

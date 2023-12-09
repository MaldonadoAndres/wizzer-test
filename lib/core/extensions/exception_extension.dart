import 'package:dio/dio.dart';
import 'package:wizzer_test/core/utils/custom_exceptions.dart';

extension ExceptionExtension on Exception {
  Exception handleException() {
    if (this is DioException) {
      final exception = this as DioException;
      switch (exception.type) {
        case DioExceptionType.connectionError:
          return CustomException('No Internet Connection');
        case DioExceptionType.connectionTimeout:
          return CustomException('Server take too much time.');
        default:
          return CustomException('Request Failed with error code ${exception.response?.statusCode}');
      }
    }
    return CustomException('Uknown Error');
  }
}

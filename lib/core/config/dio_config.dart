import 'package:dio/dio.dart';

class DioUtils {
  static Dio createRequest() {
    var dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
    ));
    dio.options.connectTimeout = 5 * 1000;
    dio.options.receiveTimeout = 5 * 1000;
    dio.options.sendTimeout = 5 * 1000;

    return dio;
  }
}

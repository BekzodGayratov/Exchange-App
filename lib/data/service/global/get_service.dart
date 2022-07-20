import 'dart:io';

import 'package:dio/dio.dart';
import 'package:music/core/config/dio_config.dart';

class GetService {
  //  GET SERVICE
  //  All get method executed here
  static Future<dynamic> getData(String baseUrl) async {
    dynamic response;
    try {
      // Go to DioUtils class to change settings of DIO
      Response res = await DioUtils.createRequest().get(baseUrl);
      if (res.statusCode == HttpStatus.ok) {
        response = res;
      }
    } on DioError catch (e) {
      // All types of exceptions are catched here
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        response = "timeout";
        return response;
      } else {
        // If device has no internet connection, this condition will be selected
        response = "internet";
        return response;
      }
    }
    return response;
  }
}

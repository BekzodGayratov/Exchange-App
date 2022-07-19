import 'package:dio/dio.dart';
import 'package:music/core/config/dio_config.dart';

class GetService {
  //  GET SERVICE
  //  All get method executed here
  static getData() async {
    dynamic response;
    try {
      // Go to DioUtils class to change settings of DIO
      Response res = await DioUtils.createRequest()
          .get("https://nbu.uz/uz/exchange-rates/json/");
    } on DioError catch (e) {
      // All types of exceptions are catched here
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        response = "timeout";
        return response;
      } else {
        response = "internet";
        return response;
      }
    }
    return response;
  }
}

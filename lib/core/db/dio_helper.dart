import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio();
  }

  // static Future<Response> getData(
  //     String url, Map<String, dynamic>? queryParameters) {
  //   return dio.get(url, queryParameters: queryParameters);
  // }
}

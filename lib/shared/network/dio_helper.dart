import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      headers: {
        'Content-Type': 'application/json',
      },
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query}) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
  }) async {
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
